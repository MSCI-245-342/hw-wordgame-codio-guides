-------------

### Heroku
You have a Heroku account, and you've created and deployed apps via the command line interface (CLI), but what do these look like from within Heroku?

Login to Heroku and check out your apps and see the various options, etc. (Do not screw anything up!  We need to mark your apps.)

### Security

Your WordGame stores a word game object in the browser's cookie.  This is highly insecure.  The WordGame object contains the answer!  To always win at the game, the only thing that you need to do is to get your cookie and examine its contents and find the word.

1. Go to your app, and start a new game.

1. Using your browser, figure out how to view the cookie (settings, etc.)

1. Copy and paste your cookie's string value into the following code to decode it:

```ruby
require 'base64'
require 'cgi'

# https://gist.github.com/thibautsacreste/3899863

def show_session(cookie)
  Base64.decode64(CGI.unescape(cookie.split("\n").join).split('--').first)    
end
```

Can you see the word?  

Q: How can we fix this?  

A: Store the cookie encrypted, or use an encrypted session ID that references the user's data stored in a database.  It is very important that even when storing an ID that it be encrypted, or else it is easy for users to impersonate other users.




