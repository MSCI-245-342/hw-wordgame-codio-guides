---------------

By now you should be familiar with the cycle:

1.  Pick a new scenario to work on (you should have 2/4 working at this point).
2.  Run the scenario and watch it fail.
3.  Develop code that makes each step of the scenario pass.
4.  Repeat till all steps passing.

Use this process to develop the code for the remaining actions `win` and `lose`.  

You will need to add code to the `show` action that checks whether the game state it is about to show is actually a winning or losing state, and if so, it should redirect to the appropriate `win` or `lose` action.  

Recall that your game logic model has a method for testing if the current game state is win, lose, or keep playing. The scenario `game_over.feature` tests these behaviors in your SaaS app.

Push to Heroku and make sure everything still works.  Give yourself a break and play a few rounds of our word game.

While you're playing, what happens if you directly add `/win` to the end of your app's URL?  Make sure the player cannot cheat by simply visiting `GET /win`.  Modify the actions for `win`, `lose`, and `show` to prevent this behavior.  (The grader  includes Cucumber features to test this behavior, but we have not provided these tests to you.  Don't worry, you are allowed to resubmit your app to the grader below multiple times.)

The grader will also test to see if your app correctly detects invalid guesses (anything not a letter, see WordGame spec for guess).  You need to set the flash message as per the instructions in app.rb.  We did not supply the Cucumber feature spec for this, either.

Make sure all Cucumber scenarios are passing plus the requirements above ("cheating" and "invalid guesses").  A shorthand way to run all of them is `cucumber features/` which runs all `.feature` files in the given directory.

### To Submit Your Work
-------------------

1. Commit and push to Github.  This is critical as it forms the final record of all your code.  If your deployed app is different than your code, this will be considered academic misconduct.

1. Push to Heroku to deploy your app.  We will grade your site using the Grader below as well as manually check it.  You need to leave it deployed.

1. Provide your URL to the Grader below and click "Check It!".  You are allowed to click "Check It!" multiple times, but **if you change your code, be sure to push it to Github** as well as Heroku.

{Check It!|assessment}(test-3203105733)
