----------------
With all this machinery in mind, lets get a new repo to clone from GitHub here: https://classroom.github.com/a/Qa593oDd

Now clone this repo and let's work on Wordgame:

```sh
git clone link-from-github
cd hw-wordgame-githubUsername
bundle
```

Developing Wordgame Using TDD and Guard
-----------------------------------------

**Goals:** Use test-driven development (TDD) based on the tests we've provided to develop the game logic for Wordgame, which forces you to think about what data is necessary to capture the game's state. This will be important when you SaaS-ify the game in the next part.

**What you will do:**  Use `autotest`, our provided test cases will be re-run each time you make a change to the app code.  One by one, the tests will go from red (failing) to green (passing) as you create the app code.  By the time you're done, you'll have a working WordGame class, ready to be "wrapped" in SaaS using Sinatra.

Overview
--------

Our WordGame works as follows:

* The computer picks a random word

* The player guesses letters in order to guess the word

* If the player guesses the word before making seven wrong guesses of letters, they win; otherwise they lose.  (Guessing the same letter repeatedly is simply ignored.)

* A letter that has already been guessed or is a non-alphabet character is considered "invalid", i.e. it is not a "valid" guess

  To make the game fun to play, each time you start a new game the app will actually retrieve a random English word from a remote server, so every game will be different.  This feature will introduce you not only to using an external service (the random-word generator) as a "building block" in a **Service-Oriented Architecture**, but also how a Cucumber scenario can test such an app deterministically with tests that **break the dependency** on the external service at testing time.

* In the app's root directory, say `bundle exec autotest`.  

This will fire up the Autotest framework, which looks for various files to figure out what kind of app you're testing and what test framework you're using.  In our case, it will discover the file called `.rspec`, which contains RSpec options and indicates we're using the RSpec testing framework.  Autotest will therefore look for test files under `spec/` and the corresponding class files in `lib/`.

We've provided a set of 18 test cases (also called "examples") to help you develop the game class. Take a look at `spec/wordgame_spec.rb`.  It specifies behaviors that it expects from the class `lib/wordgame.rb`.  Initially, we have written every spec as `xit`, so when Autotest first runs these, you should see the test case names printed in yellow, and the report "18 examples, 0 failures, 18 pending."

Now, with Autotest still running, change `xit` to `it` on line 13, and save the file.  You should immediately see Autotest wake up and re-run the tests.  You should now have 18 examples, 1 failure, 17 pending.

Okay, but what the heck are you supposed to do now?  The process of TDD is that we first write tests for the code that we want to exist, and then we write the code that makes these tests pass.  

For this assignment, the test cases have already been written for you.  Your task is to determine the specification of the WordGame class via the tests and then write the implementation of WordGame such that it passes the tests.  To help you, we first need to help you understand RSpec and unit testing.

### RSpec and Unit Testing

You should already have `spec/wordgame_spec.rb` open. Take a moment and read through the file. In some ways, it is easy to read the English in it, but in others, it isn't the easiest to understand.  This is an RSpec file.  

RSpec is a unit testing framework.  By convention, we place in an RSpec file a description `describe WordGame` for testing the class `WordGame`.  The description can contain helper code to help us write tests, e.g. `guess_several_letters`, as well as different categories of testing that are denoted with additional `describe` blocks, which may have specific `context` for them to understood.  The testing **examples** are labeled with `it` or `specify`.  We can make rspec ignore a test example by changing `it` to `xit` and `specify` to `xspecify`.  An ignored example is considered to be "pending".

Unit testing frameworks in general have each test set up in 3 parts:
1. Arrange
1. Act
1. Assert

**Arrange:** This is where we set the initial conditions of the test up.  For example, we may load a database with specific data, or we may create an object and initialize it in some specific way.  

For the `describe 'new'` block, the "Arrange" is the creation of a new WordGame object that is initiliazed with the work "glorp".  

If you look at the `describe 'guessing'` block, you'll see that for the "correctly" context (when the user correctly guesses one of the letters in the word), we see a `before :each` block.  In the `before :each` block, a new WordGame object `@game` is created and initialized with the word "garply", and then `@game` is told that the user has guessed the letter 'a'.  We see here that the method `WordGame.guess` returns a value that we store in the `@valid` variable.

The `before :each` block says "do this 'arrange' before each 'it' example in the 'correctly' block".  So here, we see that we can easily setup the same test conditions for several tests without having to copy and paste code for each test.

**Act:** This is where we run the code that we want to test.  

For the `describe 'new'` block, the "arrange" and "act" were done together, for the thing we are testing is the `WordGame.initialize(word)` method.

In the "guessing correctly" context, the `before :each` did both the "arrange" (new WordGame) and "act" (made a guess of 'a'). 

If you read further in the file to the `guessing` block's `context 'same letter repeatedly'`, you can see that the example `does not change correct guess list` adds in an "act" of `@game.guess('a')`.

**Assert:** We finish a test by checking to see if the results of our "arrange" and "act" are what we **expect**.  In some testing frameworks, we use the word "assert" to say that "this should be what we get" as a result or change in the system.  In RSpec, say what we **expect**. 

For example, back to the `describe 'new'` block, we `expect` the `@wordGame` variable to contain and object of type `WordGame`.  Then we `expect` that the method `WordGame.word` when called on the `@wordGame` object will return the same word that we intialized `@wordGame` to have.  We also see that the methods `WordGame.guesses` and `WordGame.wrong_guesses` return strings, and initially these strings are the empty string `''`.  

If we get an unexpected result in a test, we fail the test.  We need to pass all expect statements to pass a test case.

#### Self Check Questions

<details><summary>Looking at the `describe 'new'` block, according to our test case, how many arguments does the WordGame class constructor expect, and therefore what will the first line of the method definition look like that you must add to<code>wordgame.rb</code>?</summary><p><blockquote>One argument (in this example, "glorp"), and since constructors in Ruby are always named <code>initialize</code>, the first line will be<code>def initialize(new_word)</code> or something similar.</blockquote></p></details>

<br />

<details><summary>According to the tests in the <code>describe 'new'</code> block, what methods is a WordGame expected to have?</summary><p><blockquote><code>word</code>, <code>guesses</code>, and<code>wrong_guesses</code>.</blockquote></p></details>

<br />


<details><summary>According to the tests in the <code>describe 'guessing' and 'correctly'</code> block, when a user correctly guesses a letter in a word, what does the `WordGame.guess` method return?</summary><p><blockquote>a Boolean value of `true`</blockquote></p></details>

<br />

<details><summary>According to the tests in the <code>describe 'guessing' and 'correctly'</code> block, when a user correctly guesses a letter in a word, what does the `WordGame.guesses` method return?</summary><p><blockquote>The `WordGame.guesses` method returns a string of the unique letters that have been correctly guessed.</blockquote></p></details>

<br />

<details><summary>According to the tests in the <code>describe 'guessing' and 'correctly'</code> block, when a user correctly guesses a letter in a word, what does the `WordGame.wrong_guesses` method return?</summary><p><blockquote>The `WordGame.wrong_guesses` method returns a string of the unique letters that have been incorrectly guessed, and when a **correct** guess is made, there is no change in `WordGame.wrong_guesses`.</blockquote></p></details>

Etc.  

You need to continue to read these test cases to decipher the specification of the WordGame class, but you can also proceed by simply writing code to get the tests passing.  If your code passes the tests, then it must be doing the right thing, and this is the idea of TDD.  With good enough testing, we can "write to the tests".

Okay, so at this point, you probably haven't written any code, but you do have one failing test.  Go into `lib/wordgame.rb` and write code such that you can get this test to pass. When you've done this successfully and saved `wordgame.rb`, `autotest` should wake up again and the examples that were previously failing should now be passing (green).

Continue in this manner, changing `xit` to `it`  from one example at a time working your way down the specs, until you've implemented all the instance methods of the game class: `guess`, which processes a guess and modifies the instance variables `wrong_guesses` and `guesses` accordingly; `check_win_or_lose`, which returns one of the symbols `:win`, `:lose`, or `:play` depending on the current game state; and `word_with_guesses`, which substitutes the correct guesses made so far into the word.

<details><summary>How are you going to store your data in the WordGame class?</summary><p><blockquote>You know that the word is stored as string.  You know that you need to return strings for `WordGame.guesses` and `WordGame.wrong_guesses`, and so it is probably easiest to store the guesses and wrong_guesses in strings.</blockquote></p></details>

You can write additional methods as needed to help you.  For example, I wrote a method `guess_illegal_argument?` to return `true` if a user gave me an illegal argument to the guess method.  


### Debugging Tip

When running tests, you can insert the Ruby command `byebug` into your app code to drop into the command-line debugger and inspect variables and so on.  Type `h` for help at the debug prompt. Type `c` to leave the debugger and continue running your code.

#### Debugging External Services 

* Take a look at the code in the class method `get_random_word`, which retrieves a random word from a Web service we found that does just that.  Use the following command to verify that the Web service actually works this way. Run it several times to verify that you get different words.

```
$ curl --data '' http://watchout4snakes.com/wo4snakes/Random/RandomWord
```

(`--data` is necessary to force `curl` to do a POST rather than a GET.  Normally the argument to `--data` would be the encoded form fields, but in this case no form fields are needed.) Using `curl` is a great way to debug interactions with external services.  `man curl` for (much) more detail on this powerful command-line tool.

