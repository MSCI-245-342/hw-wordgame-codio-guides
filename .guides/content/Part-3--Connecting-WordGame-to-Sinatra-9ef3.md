-----------------

You've already met Sinatra.  Here's what's new in the Sinatra app skeleton [`app.rb`](../app.rb) that we provide for WordGame (open `app.rb` to read along):

* `before do...end` is a block of code executed *before* every SaaS request

* `after do...end` is executed *after* every SaaS request

* The calls  `erb :` *action* cause Sinatra to look for the file `views/`*action*`.erb` and run them through the Embedded Ruby processor, which looks for constructions `<%= like this %>`, executes the Ruby code inside, and substitutes the result.  The code is executed in the same context as the call to `erb`, so the code can "see" any instance variables set up in the `get` or `post` blocks.

#### Self Check Question

<details><summary>In ruby, instance variables (the variables of a Class), are always written starting with an `@` symbol.  In app.rb, there is the instance variable `@game`.  Thus, `@game` is found inside of a Class.  What class is it inside of?  (Careful, this is tricky.  We do not want to know the type of object that `@game` refers to.  We want the name of the class that contains `@game`.)
</summary><p><blockquote>It's an instance variable of the <code>WordgameApp</code> class in the app.rb file.  Remember we are dealing with two Ruby classes here: the <code>WordGame</code> class encapsulates the game logic itself (that is, the Model in model-view-controller), whereas <code>WordgameApp</code> encapsulates the logic that lets us deliver the game as SaaS (you can roughly think of it as the Controller logic plus the ability to render the views via <code>erb</code>).  The `@game` variable refers to the `WordGame` object that is our model of the game.</blockquote></p></details>

The Session
-----------

We've already identified the items necessary to maintain game state, and encapsulated them in the WordGame class.  Since HTTP is stateless, when a new HTTP request comes in, there is no notion of the "current game".  What we need to do, therefore, is save the game object in some way between requests.

If the game object were large, we'd probably store it in a database on the server, and place an identifier to the correct database record into the cookie.  (In fact, as we'll see, this is exactly what Rails apps do.)  But since our game state is small, we can just put the whole thing in the cookie.  Sinatra's `session` library lets us do this: in the context of the Sinatra app, anything we place into the special "magic" hash `session[]` is preserved across requests.  In fact, objects placed there are *serialized* into a text-friendly form that is preserved for us.  This behavior is switched on by the Sinatra call `enable :sessions` in `app.rb`.

There is one other session-like object we will use.  In some cases above, one action will perform some state change and then redirect to another action, such as when the Guess action (triggered by `POST /guess`) redirects to the Show action (`GET /show`) to redisplay the game state after each guess.  But what if the Guess action wants to display a message to the player, such as to inform them that they have erroneously repeated a guess?  The problem is that since every request is stateless, we need to get that message "across" the redirect, just as we need to preserve game state "across" HTTP requests.

To do this, we use the `sinatra-flash` gem, which you can see in the Gemfile.  `flash[]` is a hash for remembering short messages that persist until the *very next* request (usually a redirect), and are then erased.

#### Self Check Question

<details><summary>Why does this save us coding effort compared to just storing those messages in the <code>session[]</code> hash?</summary><p><blockquote>When we put something in <code>session[]</code> it stays there until we delete it.  The common case for a message that must survive a redirect is that it should only be shown once; <code>flash[]</code> includes the extra functionality of erasing the messages after the next request.  Thus, we don't need to remember to delete items from the flash hash, and this saves us coding effort and reduces errors.</blockquote></p></details>

Running the Sinatra app
-----------------------

As before, run the shell command `bundle exec rackup --host 0.0.0.0` to start the app, or `bundle exec rerun -- rackup 0.0.0.0` if you want to rerun the app each time you make a code change.

#### Self Check Question

<details><summary>What is the full URL you need to visit in order to visit the New Game page? (See output of rackup to see the port.)</summary><p><blockquote>The Ruby code <code>get '/new' do...</code> in <code>app.rb</code> renders the New Game page, so the full URL is in the form <code>http://name1-name2-9292.codio.io/new</code>, where name1-name2 are for your Codio box and 9292 is the port.</p></details>
<br />

Visit this URL and verify that the Start New Game page appears.

#### Self Check Question

<details><summary>Where is the HTML code for this page?</summary><p><blockquote>It's in <code>views/new.erb</code>, which is processed into HTML by the <code>erb :new</code> directive.</blockquote></p></details>
<br />

Verify that when you click the New Game button, you get an error.  This is because we've deliberately left the `<form>` that encloses this button incomplete: we haven't specified where the form should post to. We'll do that next, but we'll do it in a test-driven way.

But first, let's get our app onto Heroku.  This is actually a critical step.  We need to ensure that our app will run on heroku **before** we start making significant changes.

* First, run `bundle install` to make sure our Gemfile and Gemfile.lock are in sync.
* Next, type `git add .` to stage all changed files (including Gemfile.lock)
* Then type `git commit -m "Ready for Heroku!"` to commit all local changes.
* Next, type `heroku login -i` and authenticate.
* Since this is the first time we're telling Heroku about the WordGame app, we must type `heroku apps:create hw7-wordgame-watiamUsername` to create a new project in Heroku.  Replace "watiamUsername" with your WatIAM username. This will have Heroku prepare to recieve this code and have it create a git reference for referencing the new remote repository.  Go ahead and click on the url to see the live app on the web.  At this stage, it is a blank Heroku placeholder.
* Then, type `git push heroku master` to push your code to Heroku.
* When you want to update Heroku later, you only need to commit your changes to git locally, then push to Heroku as in the last step.
* Verify that the Heroku-deployed WordGame behaves the same as your development version before continuing. A few lines up from the bottom of the Heroku output in the terminal should have a URL ending in herokuapp.com. Find that, copy it to the clipboard, and paste it into a browser tab to see the current app.
* Verify the broken functionality by clicking the new game button.

{Submit Answer!|assessment}(free-text-3032828860)

