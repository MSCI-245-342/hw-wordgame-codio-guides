Hangperson CI 
=============

[![Build Status](https://magnum.travis-ci.com/saasbook/hw-sinatra-saas-hangperson-ci.svg?token=CPXPCn5Dy1cwCKsavtqL&branch=master)](https://magnum.travis-ci.com/saasbook/hw-sinatra-saas-hangperson-ci)

Please find instructions for the homework itself at: https://github.com/saasbook/hw-sinatra-saas-hangperson/blob/master/README.md

This is a private repo which contains the Gradescope solution and autograder, both in ZIP and expanded format.

This [template repo](https://github.com/saasbook/gradescope_rspec_assignment) has more references and examples for grading with Gradescope.

![gradescope has been enabled](./gradescope-enabled.png)



### Current Test running

Testing doesn't currently work

### Legacy Test Running

The following approach is what used to work for an old version of the grader that allowed us to grade assignsments from the command line.  However that functionality was removed following the refactoring to use the XQueue gem ...

To bundle install everything on OSX you might first need:

```
$ brew install libmagic
```

In order to run the tests first run the following to install the latest production version of the grader:

```sh
$ bundle exec cucumber install/
```

Note the above command might take a long time to install since it will be installing all the gems for the grader itself.

Assuming that installs the grader successfully you can then run the cucumber tests of the assignment itself against the production grader like so:

```sh
$ bundle exec cucumber
```


![gradescope has been enabled](./gradescope-enabled.png)

## Walkthrough 


Note that these are opinionated walkthroughs from Sam Joseph.  Opinions expressed are those of Sam Joseph alone and do not necessarily reflect the opinions of UCBerkeley or any to it's employees.

We can follow the initial instructions in "Part 0: Demystifying SaaS app creation" with these commands:

```sh
tansaku:~/workspace/hello_sinatra (master) $ mkdir hello_sinatra
tansaku:~/workspace/hello_sinatra (master) $ cd hello_sinatra
tansaku:~/workspace/hello_sinatra (master) $ git init
Initialized empty Git repository in /home/ubuntu/workspace/hello_sinatra/.git/
tansaku:~/workspace/hello_sinatra (master) $ touch Gemfile # or `bundle init`
```

and then we put the specified contents in the Gemfile and run bundle:

```sh
tansaku:~/workspace/hello_sinatra (master) $ gem install bundler
Fetching: bundler-1.15.3.gem (100%)
Successfully installed bundler-1.15.3
1 gem installed
tansaku:~/workspace/hello_sinatra (master) $ bundle
Fetching gem metadata from https://rubygems.org/..........
Fetching version metadata from https://rubygems.org/.
Resolving dependencies...
Using bundler 1.15.3
Fetching mustermann 1.0.0
Installing mustermann 1.0.0
Fetching rack 2.0.3
Installing rack 2.0.3
Fetching tilt 2.0.8
Installing tilt 2.0.8
Fetching rack-protection 2.0.0
Installing rack-protection 2.0.0
Fetching sinatra 2.0.0
Installing sinatra 2.0.0
Bundle complete! 1 Gemfile dependency, 6 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
```

We may need to use `gem install bundler` if the bundle gem is not currently on our system.   Then we can add our files to version control as specified:

```sh
tansaku:~/workspace/hello_sinatra (master) $ git add .
tansaku:~/workspace/hello_sinatra (master) $ git commit -m 'Set up the Gemfile'
[master (root-commit) eeee73a] Set up the Gemfile
 2 files changed, 29 insertions(+)
 create mode 100644 Gemfile
 create mode 100644 Gemfile.lock
```

We create the `app.rb` and `config.ru` files as specified, add the contents indicated in the instructions, and add to version control:

```sh
tansaku:~/workspace/hello_sinatra (master) $ touch app.rb
tansaku:~/workspace/hello_sinatra (master) $ touch config.ru
tansaku:~/workspace/hello_sinatra (master) $ git add .
tansaku:~/workspace/hello_sinatra (master) $ git commit -m 'adds app.rb and config.ru files'
[master 0dd416c] adds app.rb and config.ru files
 2 files changed, 9 insertions(+)
 create mode 100644 app.rb
 create mode 100644 config.ru
```

We can now run the server on cloud 9:

```sh
tansaku:~/workspace/hello_sinatra (master) $ bundle exec rackup -p $PORT -o $IP
[2017-07-29 09:04:07] INFO  WEBrick 1.3.1
[2017-07-29 09:04:07] INFO  ruby 2.3.0 (2015-12-25) [x86_64-linux]
[2017-07-29 09:04:07] INFO  WEBrick::HTTPServer#start: pid=2222 port=8080
```

and cloud 9 will tell us the URL we can go to to see the running app:

![Cloud9 Help: Your code is running at URL message](images/Screenshot%202017-07-29%2018.02.01.png?dl=1)

It should look like this:

![Hello World message from Sinatra](images/Screenshot%202017-07-29%2018.03.24.png?dl=1)

After you've clicked through on a message about how this is an application preview:

![This is the preview of an application being developed with Cloud9 IDE](images/Screenshot%202017-07-29%2018.04.36.png?dl=1)

As we proceed to follow the instructions we'll see the live log from the server displayed in the terminal shell:

```sh
133.202.198.78 - - [29/Jul/2017:09:04:10 +0000] "GET / HTTP/1.1" 200 74 0.0131
133.202.198.78 - - [29/Jul/2017:09:04:32 +0000] "GET /favicon.ico HTTP/1.1" 404 533 0.0012
133.202.198.78 - - [29/Jul/2017:09:07:04 +0000] "GET /hello HTTP/1.1" 404 527 0.0010
133.202.198.78 - - [29/Jul/2017:09:07:05 +0000] "GET /__sinatra__/404.png HTTP/1.1" 200 18893 0.0039
133.202.198.78 - - [29/Jul/2017:09:08:28 +0000] "GET / HTTP/1.1" 200 74 0.0009
```

We'll have to quite the app with Ctrl-C and restart to see any changes to our app.rb file:

```sh
^C[2017-07-29 09:10:48] INFO  going to shutdown ...
[2017-07-29 09:10:48] INFO  WEBrick::HTTPServer#start done.
tansaku:~/workspace/hello_sinatra (master) $ bundle exec rackup -p $PORT -o $IP
[2017-07-29 09:10:52] INFO  WEBrick 1.3.1
[2017-07-29 09:10:52] INFO  ruby 2.3.0 (2015-12-25) [x86_64-linux]
[2017-07-29 09:10:52] INFO  WEBrick::HTTPServer#start: pid=2253 port=8080
```

Now you should see any changes you made to app.rb, such as "Goodbye World".  The instructions now tell you to add the rerun gem to the Gemfile and re-run the server with a different command.  If you can remember how to shut down the server (Ctrl-c) you might get the following message:

```sh
^C[2017-07-29 09:13:52] INFO  going to shutdown ...
[2017-07-29 09:13:52] INFO  WEBrick::HTTPServer#start done.
tansaku:~/workspace/hello_sinatra (master) $ bundle exec rerun -- rackup -p $PORT -o $IP
bundler: command not found: rerun
Install missing gem executables with `bundle install`
```

Note that `bundle` is short for `bundle install` - they are equivalent - use the former if you prefer to type less:

```sh
tansaku:~/workspace/hello_sinatra (master) $ bundle
Fetching gem metadata from https://rubygems.org/...........
Fetching version metadata from https://rubygems.org/..
Fetching dependency metadata from https://rubygems.org/.
Resolving dependencies...
Using bundler 1.15.3
Fetching ffi 1.9.18
Installing ffi 1.9.18 with native extensions
Fetching rb-fsevent 0.10.2
Installing rb-fsevent 0.10.2
Fetching ruby_dep 1.5.0
Installing ruby_dep 1.5.0
Using mustermann 1.0.0
Using rack 2.0.3
Using tilt 2.0.8
Fetching rb-inotify 0.9.10
Installing rb-inotify 0.9.10
Using rack-protection 2.0.0
Fetching listen 3.1.5
Installing listen 3.1.5
Using sinatra 2.0.0
Fetching rerun 0.11.0
Installing rerun 0.11.0
Bundle complete! 2 Gemfile dependencies, 12 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
```

Now we can use rerun:

```sh
tansaku:~/workspace/hello_sinatra (master) $ bundle exec rerun -- rackup -p $PORT -o $IP              
RubyDep: WARNING: Your Ruby is outdated/buggy.
RubyDep: WARNING: Your Ruby is: 2.3.0 (buggy). Recommendation: upgrade to 2.3.1.
RubyDep: WARNING: (To disable warnings, see:http://github.com/e2/ruby_dep/wiki/Disabling-warnings )

09:16:55 [rerun] Hello_sinatra launched
[2017-07-29 09:16:56] INFO  WEBrick 1.3.1
[2017-07-29 09:16:56] INFO  ruby 2.3.0 (2015-12-25) [x86_64-linux]
[2017-07-29 09:16:56] INFO  WEBrick::HTTPServer#start: pid=2653 port=8080
09:16:57 [rerun] Watching . for **/*.{rb,js,coffee,css,scss,sass,erb,html,haml,ru,yml,slim,md,feature}
```

We should be using a more recent version of ruby, but will need to wait for Cloud9 to update ... :-(

Anyhow, with rerun in operation we can check that changes to app.rb are immediately available.  And our terminal output will look something like this:


```sh
09:17:55 [rerun] Change detected: 1 modified: app.rb
/usr/local/rvm/gems/ruby-2.3.0/gems/rerun-0.11.0/lib/rerun/runner.rb:254:in `stop': Object#timeout is deprecated, use Timeout.timeout instead.
09:17:55 [rerun] Sending signal TERM to 2653
[2017-07-29 09:17:55] FATAL SignalException: SIGTERM
        /usr/local/rvm/rubies/ruby-2.3.0/lib/ruby/2.3.0/webrick/server.rb:177:in `select'
        /usr/local/rvm/rubies/ruby-2.3.0/lib/ruby/2.3.0/webrick/server.rb:177:in `block in start'
        /usr/local/rvm/rubies/ruby-2.3.0/lib/ruby/2.3.0/webrick/server.rb:33:in `start'
        /usr/local/rvm/rubies/ruby-2.3.0/lib/ruby/2.3.0/webrick/server.rb:164:in `start'
        /usr/local/rvm/gems/ruby-2.3.0/gems/rack-2.0.3/lib/rack/handler/webrick.rb:34:in `run'
        /usr/local/rvm/gems/ruby-2.3.0/gems/rack-2.0.3/lib/rack/server.rb:297:in `start'
        /usr/local/rvm/gems/ruby-2.3.0/gems/rack-2.0.3/lib/rack/server.rb:148:in `start'
        /usr/local/rvm/gems/ruby-2.3.0/gems/rack-2.0.3/bin/rackup:4:in `<top (required)>'
        /usr/local/rvm/gems/ruby-2.3.0/bin/rackup:23:in `load'
        /usr/local/rvm/gems/ruby-2.3.0/bin/rackup:23:in `<main>'
        /usr/local/rvm/gems/ruby-2.3.0/bin/ruby_executable_hooks:15:in `eval'
        /usr/local/rvm/gems/ruby-2.3.0/bin/ruby_executable_hooks:15:in `<main>'
[2017-07-29 09:17:55] INFO  going to shutdown ...
[2017-07-29 09:17:55] INFO  WEBrick::HTTPServer#start done.

09:17:55 [rerun] Hello_sinatra restarted
[2017-07-29 09:17:55] INFO  WEBrick 1.3.1
[2017-07-29 09:17:55] INFO  ruby 2.3.0 (2015-12-25) [x86_64-linux]
[2017-07-29 09:17:55] INFO  WEBrick::HTTPServer#start: pid=2792 port=8080
133.202.198.78 - - [29/Jul/2017:09:17:57 +0000] "GET / HTTP/1.1" 200 74 0.0120
```

To commit out latest changes to git we can use the following commands:

```
^C
09:24:59 [rerun] Hello_sinatra stopping
[2017-07-29 09:24:59] INFO  going to shutdown ...
/usr/local/rvm/gems/ruby-2.3.0/gems/rerun-0.11.0/lib/rerun/runner.rb:254:in `stop': Object#timeout is deprecated, use Timeout.timeout instead.
[2017-07-29 09:24:59] INFO  WEBrick::HTTPServer#start done.
09:24:59 [rerun] Sending signal TERM to 3013
tansaku:~/workspace/hello_sinatra (master) $ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   Gemfile
        modified:   Gemfile.lock

no changes added to commit (use "git add" and/or "git commit -a")
tansaku:~/workspace/hello_sinatra (master) $ git add .
tansaku:~/workspace/hello_sinatra (master) $ git commit -m 'adds rerun gem'
[master 6458fb5] adds rerun gem
 2 files changed, 17 insertions(+), 1 deletion(-)
```

`git status` just allows us to check what has changed since we last committed.


We can then update the heroku toolbelt as specified:

```sh
tansaku:~/workspace/hello_sinatra (master) $ heroku --version
heroku-toolbelt/3.43.13 (x86_64-linux) ruby/2.3.0
heroku-cli/5.4.8-eee5ec9 (linux-amd64) go1.7.1
You have no installed plugins.
tansaku:~/workspace/hello_sinatra (master) $ wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
--2017-07-29 09:29:46--  https://toolbelt.heroku.com/install-ubuntu.sh
Resolving toolbelt.heroku.com (toolbelt.heroku.com)... 23.21.108.35, 54.243.118.8, 54.243.150.141
Connecting to toolbelt.heroku.com (toolbelt.heroku.com)|23.21.108.35|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 719 [text/plain]
Saving to: ‘STDOUT’

100%[============================================================>] 719         --.-K/s   in 0s      

2017-07-29 09:29:46 (130 MB/s) - written to stdout [719/719]

This script requires superuser access to install apt packages.
You will be prompted for your password by sudo.
--2017-07-29 09:29:47--  https://toolbelt.heroku.com/apt/release.key
Resolving toolbelt.heroku.com (toolbelt.heroku.com)... 54.243.150.141, 54.243.118.8, 23.21.108.35
Connecting to toolbelt.heroku.com (toolbelt.heroku.com)|54.243.150.141|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1737 (1.7K) [application/octet-stream]
Saving to: ‘STDOUT’

100%[============================================================>] 1,737       --.-K/s   in 0s      

2017-07-29 09:29:47 (321 MB/s) - written to stdout [1737/1737]

OK
Get:1 http://ppa.launchpad.net trusty InRelease [15.5 kB]
Get:2 http://security.ubuntu.com trusty-security InRelease [65.9 kB]           
Ign http://europe-west1.gce.clouds.archive.ubuntu.com trusty InRelease         
Get:3 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-updates InRelease [65.9 kB]
Get:4 http://ppa.launchpad.net trusty InRelease [15.4 kB]                      
Ign http://downloads-distro.mongodb.org dist InRelease                         
Get:5 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-backports InRelease [65.9 kB]
Get:6 http://ppa.launchpad.net trusty/main amd64 Packages [23.2 kB]            
Ign http://toolbelt.heroku.com ./ InRelease                                    
Get:7 http://europe-west1.gce.clouds.archive.ubuntu.com trusty Release.gpg [933 B]
Hit http://downloads-distro.mongodb.org dist Release.gpg                       
Get:8 http://ppa.launchpad.net trusty/main i386 Packages [23.2 kB]             
Get:9 http://security.ubuntu.com trusty-security/main Sources [175 kB]         
Get:10 http://security.ubuntu.com trusty-security/universe Sources [72.1 kB]   
Get:11 http://security.ubuntu.com trusty-security/main amd64 Packages [799 kB] 
Get:12 http://europe-west1.gce.clouds.archive.ubuntu.com trusty Release [58.5 kB]
Get:13 http://security.ubuntu.com trusty-security/universe amd64 Packages [228 kB]
Get:14 http://security.ubuntu.com trusty-security/main i386 Packages [740 kB]  
Get:15 http://toolbelt.heroku.com ./ Release.gpg [473 B]                       
Hit http://downloads-distro.mongodb.org dist Release                           
Get:16 http://security.ubuntu.com trusty-security/universe i386 Packages [229 kB]
Get:17 http://ppa.launchpad.net trusty/main amd64 Packages [3427 B]            
Get:18 http://ppa.launchpad.net trusty/main i386 Packages [3427 B]             
Get:19 http://toolbelt.heroku.com ./ Release [1609 B]                     
Get:20 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-updates/main Sources [495 kB]
Hit http://downloads-distro.mongodb.org dist/10gen amd64 Packages              
Get:21 http://toolbelt.heroku.com ./ Packages [636 B]               
Get:22 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-updates/restricted Sources [6470 B]
Get:23 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-updates/universe Sources [235 kB]
Hit http://downloads-distro.mongodb.org dist/10gen i386 Packages               
Get:24 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-updates/multiverse Sources [7661 B]
Get:25 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-updates/main amd64 Packages [1249 kB]
Get:26 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-updates/restricted amd64 Packages [21.2 kB]
Get:27 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-updates/universe amd64 Packages [541 kB]
Get:28 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-updates/multiverse amd64 Packages [15.6 kB]
Get:29 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-updates/main i386 Packages [1188 kB]
Get:30 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-updates/restricted i386 Packages [20.9 kB]
Get:31 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-updates/universe i386 Packages [543 kB]
Get:32 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-updates/multiverse i386 Packages [16.1 kB]
Get:33 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-backports/main Sources [10.4 kB]
Get:34 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-backports/restricted Sources [40 B]
Get:35 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-backports/universe Sources [41.2 kB]
Get:36 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-backports/multiverse Sources [1751 B]
Get:37 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-backports/main amd64 Packages [14.8 kB]
Get:38 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-backports/restricted amd64 Packages [40 B]
Get:39 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-backports/universe amd64 Packages [52.6 kB]
Get:40 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-backports/multiverse amd64 Packages [1396 B]
Get:41 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-backports/main i386 Packages [14.8 kB]
Get:42 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-backports/restricted i386 Packages [40 B]
Get:43 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-backports/universe i386 Packages [52.6 kB]
Get:44 http://europe-west1.gce.clouds.archive.ubuntu.com trusty-backports/multiverse i386 Packages [1381 B]
Get:45 http://europe-west1.gce.clouds.archive.ubuntu.com trusty/main Sources [1335 kB]
Get:46 http://europe-west1.gce.clouds.archive.ubuntu.com trusty/restricted Sources [5335 B]
Get:47 http://europe-west1.gce.clouds.archive.ubuntu.com trusty/universe Sources [7926 kB]
Get:48 http://europe-west1.gce.clouds.archive.ubuntu.com trusty/multiverse Sources [211 kB]
Get:49 http://europe-west1.gce.clouds.archive.ubuntu.com trusty/main amd64 Packages [1743 kB]
Get:50 http://europe-west1.gce.clouds.archive.ubuntu.com trusty/restricted amd64 Packages [16.0 kB]
Get:51 http://europe-west1.gce.clouds.archive.ubuntu.com trusty/universe amd64 Packages [7589 kB]
Get:52 http://europe-west1.gce.clouds.archive.ubuntu.com trusty/multiverse amd64 Packages [169 kB]
Get:53 http://europe-west1.gce.clouds.archive.ubuntu.com trusty/main i386 Packages [1739 kB]
Get:54 http://europe-west1.gce.clouds.archive.ubuntu.com trusty/restricted i386 Packages [16.4 kB]
Get:55 http://europe-west1.gce.clouds.archive.ubuntu.com trusty/universe i386 Packages [7597 kB]
Get:56 http://europe-west1.gce.clouds.archive.ubuntu.com trusty/multiverse i386 Packages [172 kB]
Fetched 35.6 MB in 8s (4093 kB/s)                                              
Reading package lists... Done
W: Size of file /var/lib/apt/lists/toolbelt.heroku.com_ubuntu_._Packages.gz is not what the server reported 636 725
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  heroku
The following packages will be upgraded:
  heroku heroku-toolbelt
2 upgraded, 0 newly installed, 0 to remove and 225 not upgraded.
Need to get 1492 B of archives.
After this operation, 0 B of additional disk space will be used.
Get:1 http://toolbelt.heroku.com/ubuntu/ ./ heroku-toolbelt 3.99.4 [702 B]
Get:2 http://toolbelt.heroku.com/ubuntu/ ./ heroku 3.99.4 [790 B]
Fetched 1492 B in 0s (2218 B/s) 
(Reading database ... 74739 files and directories currently installed.)
Preparing to unpack .../heroku-toolbelt_3.99.4_all.deb ...
Unpacking heroku-toolbelt (3.99.4) over (3.43.13) ...
Preparing to unpack .../archives/heroku_3.99.4_all.deb ...
Unpacking heroku (3.99.4) over (3.43.13) ...
Setting up heroku (3.99.4) ...
+ uname -m
+ MACHINE_TYPE=x86_64
+ [ x86_64 = x86_64 ]
+ ARCH=x64
+ mkdir -p /usr/local
+ cd /usr/local
+ wget -qO- https://cli-assets.heroku.com/heroku-cli/channels/stable/heroku-cli-linux-x64.tar.gz
+ tar xz
+ rm -rf /usr/local/heroku
+ mv /usr/local/heroku-cli-v6.13.5-5be2d1f-linux-x64 /usr/local/heroku
+ ln -sf /usr/local/heroku/bin/heroku /usr/bin/heroku
Setting up heroku-toolbelt (3.99.4) ...
tansaku:~/workspace/hello_sinatra (master) $ heroku --version
heroku-cli/6.13.5-5be2d1f (linux-x64) node-v8.2.1
```

Assuming you have a heroku account you can then login as follows:

```
tansaku:~/workspace/hello_sinatra (master) $ heroku login
Enter your Heroku credentials:
Email: <YOUR EMAIL>
Password: ************
Logged in as <YOUR EMAIL>
```

You can then run heroku create:

```sh
tansaku:~/workspace/hello_sinatra (master) $ heroku create hangperson2017
Creating ⬢ hangperson2017... done
https://hangperson2017.herokuapp.com/ | https://git.heroku.com/hangperson2017.git
```

Note that if you specify a name for the app, that will become the subdomain of the URL, and might be easier for you to remember what the app was for later. 

Now we need to add the Procfile with the specified contents and commit that to git:

```sh
tansaku:~/workspace/hello_sinatra (master) $ touch Procfile
tansaku:~/workspace/hello_sinatra (master) $ git status
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

        Procfile

nothing added to commit but untracked files present (use "git add" to track)
tansaku:~/workspace/hello_sinatra (master) $ git add .
tansaku:~/workspace/hello_sinatra (master) $ git commit -m 'adds Procfile'
[master b9800f4] adds Procfile
 1 file changed, 1 insertion(+)
 create mode 100644 Procfile
```


Then we can deploy to heroku:

```
tansaku:~/workspace/hello_sinatra (master) $ git push heroku master
Counting objects: 15, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (13/13), done.
Writing objects: 100% (15/15), 1.64 KiB | 0 bytes/s, done.
Total 15 (delta 4), reused 0 (delta 0)
remote: Compressing source files... done.
remote: Building source:
remote: 
remote: -----> Ruby app detected
remote: -----> Compiling Ruby/Rack
remote: -----> Using Ruby version: ruby-2.3.0
remote: -----> Installing dependencies using bundler 1.15.2
remote:        Running: bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin -j4 --deployment
remote:        Warning: the running version of Bundler (1.15.2) is older than the version that created the lockfile (1.15.3). We suggest you upgrade to the latest version of Bundler by running `gem install bundler`.
remote:        Fetching gem metadata from https://rubygems.org/.........
remote:        Fetching version metadata from https://rubygems.org/.
remote:        Using bundler 1.15.2
remote:        Fetching mustermann 1.0.0
remote:        Fetching rack 2.0.3
remote:        Fetching tilt 2.0.8
remote:        Installing mustermann 1.0.0
remote:        Installing tilt 2.0.8
remote:        Installing rack 2.0.3
remote:        Fetching rack-protection 2.0.0
remote:        Installing rack-protection 2.0.0
remote:        Fetching sinatra 2.0.0
remote:        Installing sinatra 2.0.0
remote:        Bundle complete! 2 Gemfile dependencies, 6 gems now installed.
remote:        Gems in the groups development and test were not installed.
remote:        Bundled gems are installed into ./vendor/bundle.
remote:        Bundle completed (1.91s)
remote:        Cleaning up the bundler cache.
remote:        Warning: the running version of Bundler (1.15.2) is older than the version that created the lockfile (1.15.3). We suggest you upgrade to the latest version of Bundler by running `gem install bundler`.
remote: -----> Detecting rake tasks
remote: 
remote: -----> Discovering process types
remote:        Procfile declares types     -> web
remote:        Default types for buildpack -> console, rake
remote: 
remote: -----> Compressing...
remote:        Done: 17.7M
remote: -----> Launching...
remote:        Released v4
remote:        https://hangperson2017.herokuapp.com/ deployed to Heroku
remote: 
remote: Verifying deploy... done.
To https://git.heroku.com/hangperson2017.git
 * [new branch]      master -> master
```

And we can see the app running in the specified location:

https://hangperson2017.herokuapp.com/

![hello world on heroku app](images/Screenshot%202017-07-31%2017.08.39.png)
Note that these are opinionated walkthroughs from Sam Joseph.  Opinions expressed are those of Sam Joseph alone and do not necessarily reflect the opinions of UCBerkeley or any to it's employees.

We start by following the instructions to clone the skeleton code.  Note that we should do this in the root workspace/ directory on c9 to avoid a git clobber.  Specifically we move out of the previous hello-world app dir and onto the c9 root to create a new project with it's own git control.

```sh
c9testaduror:~/workspace $ git clone https://github.com/saasbook/hw-sinatra-saas-hangperson
Cloning into 'hw-sinatra-saas-hangperson'...
remote: Counting objects: 348, done.
remote: Compressing objects: 100% (15/15), done.
remote: Total 348 (delta 9), reused 14 (delta 5), pack-reused 328
Receiving objects: 100% (348/348), 158.90 KiB | 0 bytes/s, done.
Resolving deltas: 100% (182/182), done.
```

Then we move into that directory and try to run `bundle exec auto test` as specified

```sh
c9testaduror:~/workspace $ cd hw-sinatra-saas-hangperson/
RVM used your Gemfile for selecting Ruby, it is all fine - Heroku does that too,
you can ignore these warnings with 'rvm rvmrc warning ignore /home/ubuntu/workspace/hw-sinatra-saas-hangperson/Gemfile'.
To ignore the warning for all files run 'rvm rvmrc warning ignore allGemfiles'.

c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ bundle exec autotest
bundler: command not found: autotest
Install missing gem executables with `bundle install`
```

which gives us an error reminding us to run `bundle install` or the equivalent `bundle`.  This may take some time to complete:


```sh
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ bundle
Fetching gem metadata from https://rubygems.org/.........
Fetching version metadata from https://rubygems.org/..
Fetching dependency metadata from https://rubygems.org/.
Fetching ZenTest 4.11.0
Installing ZenTest 4.11.0
Fetching addressable 2.4.0
Installing addressable 2.4.0
Fetching builder 3.2.2
Installing builder 3.2.2
Using bundler 1.15.3
Fetching columnize 0.9.0
Installing columnize 0.9.0
Fetching mime-types-data 3.2016.0521
Installing mime-types-data 3.2016.0521
Fetching mini_portile2 2.1.0
Installing mini_portile2 2.1.0
Fetching pkg-config 1.1.7
Installing pkg-config 1.1.7
Fetching rack 1.6.4
Installing rack 1.6.4
Fetching hitimes 1.2.4
Installing hitimes 1.2.4 with native extensions
Fetching safe_yaml 1.0.4
Installing safe_yaml 1.0.4
Fetching multi_json 1.12.1
Installing multi_json 1.12.1
Fetching diff-lcs 1.2.5
Installing diff-lcs 1.2.5
Fetching multi_test 0.1.2
Installing multi_test 0.1.2
Fetching extlib 0.9.16
Installing extlib 0.9.16
Fetching highline 1.7.8
Installing highline 1.7.8
Fetching docile 1.1.5
Installing docile 1.1.5
Fetching ffi 1.9.10
Installing ffi 1.9.10 with native extensions
Using json 1.8.3
Fetching rb-fsevent 0.9.7
Installing rb-fsevent 0.9.7
Fetching rspec-support 3.3.0
Installing rspec-support 3.3.0
Fetching simplecov-html 0.10.0
Installing simplecov-html 0.10.0
Fetching tilt 2.0.5
Installing tilt 2.0.5
Fetching launchy 2.4.3
Installing launchy 2.4.3
Fetching byebug 5.0.0
Installing byebug 5.0.0 with native extensions
Fetching mime-types 3.1
Installing mime-types 3.1
Fetching nokogiri 1.6.8
Installing nokogiri 1.6.8 with native extensions
Fetching rack-test 0.6.3
Installing rack-test 0.6.3
Fetching rack-protection 1.5.3
Installing rack-protection 1.5.3
Fetching rack_session_access 0.1.1
Installing rack_session_access 0.1.1
Fetching timers 4.0.4
Installing timers 4.0.4
Fetching crack 0.4.3
Installing crack 0.4.3
Fetching gherkin 2.12.2
Installing gherkin 2.12.2 with native extensions
Fetching templater 1.0.0
Installing templater 1.0.0
Fetching rb-inotify 0.9.7
Installing rb-inotify 0.9.7
Fetching rspec-core 3.3.2
Installing rspec-core 3.3.2
Fetching rspec-expectations 3.3.1
Installing rspec-expectations 3.3.1
Fetching rspec-mocks 3.3.2
Installing rspec-mocks 3.3.2
Fetching simplecov 0.10.0
Installing simplecov 0.10.0
Fetching xpath 2.0.0
Installing xpath 2.0.0
Fetching sinatra 1.4.7
Installing sinatra 1.4.7
Fetching celluloid 0.16.0
Installing celluloid 0.16.0
Fetching webmock 1.21.0
Installing webmock 1.21.0
Fetching cucumber-core 1.1.3
Installing cucumber-core 1.1.3
Fetching cucumber-sinatra 0.5.0
Installing cucumber-sinatra 0.5.0
Fetching rspec-autotest 1.0.0
Installing rspec-autotest 1.0.0
Fetching rspec 3.3.0
Installing rspec 3.3.0
Fetching capybara 2.4.4
Installing capybara 2.4.4
Fetching sinatra-flash 0.3.0
Installing sinatra-flash 0.3.0
Fetching listen 2.10.1
Installing listen 2.10.1
Fetching cucumber 2.0.0
Installing cucumber 2.0.0
Fetching rerun 0.10.0
Installing rerun 0.10.0
Bundle complete! 15 Gemfile dependencies, 52 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
```


Now `autotest` will give us the following, largely yellow, output:

```sh
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ bundle exec autotest
(Not running features.  To run features in autotest, set AUTOFEATURE=true.)
loading autotest/rspec
"/usr/local/rvm/rubies/ruby-2.3.0/bin/ruby" -rrubygems -S "/usr/local/rvm/gems/ruby-2.3.0/gems/rspec-core-3.3.2/exe/rspec" --tty "/home/ubuntu/workspace/hw-sinatra-saas-hangperson/spec/hangperson_game_spec.rb"

HangpersonGame
  new
    takes a parameter and returns a HangpersonGame object (PENDING: No reason given)
  guessing
    correctly
      changes correct guess list (PENDING: No reason given)
      returns true (PENDING: No reason given)
    incorrectly
      changes wrong guess list (PENDING: No reason given)
      returns true (PENDING: No reason given)
    same letter repeatedly
      does not change correct guess list (PENDING: No reason given)
      does not change wrong guess list (PENDING: No reason given)
      returns false (PENDING: No reason given)
      is case insensitive (PENDING: No reason given)
    invalid
      throws an error when empty (PENDING: No reason given)
      throws an error when not a letter (PENDING: No reason given)
      throws an error when nil (PENDING: No reason given)
  displayed word with guesses
    should be 'b-n-n-' when guesses are 'bn' (PENDING: No reason given)
    should be '------' when guesses are 'def' (PENDING: No reason given)
    should be 'banana' when guesses are 'ban' (PENDING: No reason given)
  game status
    should be win when all letters guessed (PENDING: No reason given)
    should be lose after 7 incorrect guesses (PENDING: No reason given)
    should continue play if neither win nor lose (PENDING: No reason given)

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) HangpersonGame new takes a parameter and returns a HangpersonGame object
     # No reason given
     Failure/Error: expect(@hangpersonGame.word).to eq('glorp')
     NoMethodError:
       undefined method `word' for #<HangpersonGame:0x00000002e23f18 @word="glorp">
     # ./spec/hangperson_game_spec.rb:16:in `block (3 levels) in <top (required)>'

  2) HangpersonGame guessing correctly changes correct guess list
     # No reason given
     Failure/Error: @valid = @game.guess('a')
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x00000002e1d1b8 @word="garply">
     # ./spec/hangperson_game_spec.rb:26:in `block (4 levels) in <top (required)>'

  3) HangpersonGame guessing correctly returns true
     # No reason given
     Failure/Error: @valid = @game.guess('a')
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x00000002e1a7b0 @word="garply">
     # ./spec/hangperson_game_spec.rb:26:in `block (4 levels) in <top (required)>'

  4) HangpersonGame guessing incorrectly changes wrong guess list
     # No reason given
     Failure/Error: @valid = @game.guess('z')
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x00000002e17510 @word="garply">
     # ./spec/hangperson_game_spec.rb:39:in `block (4 levels) in <top (required)>'

  5) HangpersonGame guessing incorrectly returns true
     # No reason given
     Failure/Error: @valid = @game.guess('z')
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x00000002e14798 @word="garply">
     # ./spec/hangperson_game_spec.rb:39:in `block (4 levels) in <top (required)>'

  6) HangpersonGame guessing same letter repeatedly does not change correct guess list
     # No reason given
     Failure/Error: game.guess(letter)
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x00000002e09168 @word="garply">
     # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
     # ./spec/hangperson_game_spec.rb:7:in `chars'
     # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
     # ./spec/hangperson_game_spec.rb:52:in `block (4 levels) in <top (required)>'

  7) HangpersonGame guessing same letter repeatedly does not change wrong guess list
     # No reason given
     Failure/Error: game.guess(letter)
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x00000002e02390 @word="garply">
     # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
     # ./spec/hangperson_game_spec.rb:7:in `chars'
     # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
     # ./spec/hangperson_game_spec.rb:52:in `block (4 levels) in <top (required)>'

  8) HangpersonGame guessing same letter repeatedly returns false
     # No reason given
     Failure/Error: game.guess(letter)
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x00000002dfee98 @word="garply">
     # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
     # ./spec/hangperson_game_spec.rb:7:in `chars'
     # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
     # ./spec/hangperson_game_spec.rb:52:in `block (4 levels) in <top (required)>'

  9) HangpersonGame guessing same letter repeatedly is case insensitive
     # No reason given
     Failure/Error: game.guess(letter)
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x00000002dfdde0 @word="garply">
     # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
     # ./spec/hangperson_game_spec.rb:7:in `chars'
     # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
     # ./spec/hangperson_game_spec.rb:52:in `block (4 levels) in <top (required)>'

  10) HangpersonGame guessing invalid throws an error when empty
      # No reason given
      Failure/Error: expect { @game.guess('') }.to raise_error(ArgumentError)
        expected ArgumentError, got #<NoMethodError: undefined method `guess' for #<HangpersonGame:0x00000002debe60 @word="foobar">> with backtrace:
          # ./spec/hangperson_game_spec.rb:78:in `block (5 levels) in <top (required)>'
          # ./spec/hangperson_game_spec.rb:78:in `block (4 levels) in <top (required)>'
      # ./spec/hangperson_game_spec.rb:78:in `block (4 levels) in <top (required)>'

  11) HangpersonGame guessing invalid throws an error when not a letter
      # No reason given
      Failure/Error: expect { @game.guess('%') }.to raise_error(ArgumentError)
        expected ArgumentError, got #<NoMethodError: undefined method `guess' for #<HangpersonGame:0x000000029875b8 @word="foobar">> with backtrace:
          # ./spec/hangperson_game_spec.rb:81:in `block (5 levels) in <top (required)>'
          # ./spec/hangperson_game_spec.rb:81:in `block (4 levels) in <top (required)>'
      # ./spec/hangperson_game_spec.rb:81:in `block (4 levels) in <top (required)>'

  12) HangpersonGame guessing invalid throws an error when nil
      # No reason given
      Failure/Error: expect { @game.guess(nil) }.to raise_error(ArgumentError)
        expected ArgumentError, got #<NoMethodError: undefined method `guess' for #<HangpersonGame:0x00000002975138 @word="foobar">> with backtrace:
          # ./spec/hangperson_game_spec.rb:84:in `block (5 levels) in <top (required)>'
          # ./spec/hangperson_game_spec.rb:84:in `block (4 levels) in <top (required)>'
      # ./spec/hangperson_game_spec.rb:84:in `block (4 levels) in <top (required)>'

  13) HangpersonGame displayed word with guesses should be 'b-n-n-' when guesses are 'bn'
      # No reason given
      Failure/Error: game.guess(letter)
      NoMethodError:
        undefined method `guess' for #<HangpersonGame:0x00000002964e28 @word="banana">
      # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
      # ./spec/hangperson_game_spec.rb:7:in `chars'
      # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
      # ./spec/hangperson_game_spec.rb:101:in `block (4 levels) in <top (required)>'

  14) HangpersonGame displayed word with guesses should be '------' when guesses are 'def'
      # No reason given
      Failure/Error: game.guess(letter)
      NoMethodError:
        undefined method `guess' for #<HangpersonGame:0x0000000295e140 @word="banana">
      # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
      # ./spec/hangperson_game_spec.rb:7:in `chars'
      # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
      # ./spec/hangperson_game_spec.rb:101:in `block (4 levels) in <top (required)>'

  15) HangpersonGame displayed word with guesses should be 'banana' when guesses are 'ban'
      # No reason given
      Failure/Error: game.guess(letter)
      NoMethodError:
        undefined method `guess' for #<HangpersonGame:0x0000000295b2b0 @word="banana">
      # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
      # ./spec/hangperson_game_spec.rb:7:in `chars'
      # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
      # ./spec/hangperson_game_spec.rb:101:in `block (4 levels) in <top (required)>'

  16) HangpersonGame game status should be win when all letters guessed
      # No reason given
      Failure/Error: game.guess(letter)
      NoMethodError:
        undefined method `guess' for #<HangpersonGame:0x0000000294fbe0 @word="dog">
      # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
      # ./spec/hangperson_game_spec.rb:7:in `chars'
      # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
      # ./spec/hangperson_game_spec.rb:112:in `block (3 levels) in <top (required)>'

  17) HangpersonGame game status should be lose after 7 incorrect guesses
      # No reason given
      Failure/Error: game.guess(letter)
      NoMethodError:
        undefined method `guess' for #<HangpersonGame:0x0000000294c828 @word="dog">
      # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
      # ./spec/hangperson_game_spec.rb:7:in `chars'
      # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
      # ./spec/hangperson_game_spec.rb:116:in `block (3 levels) in <top (required)>'

  18) HangpersonGame game status should continue play if neither win nor lose
      # No reason given
      Failure/Error: game.guess(letter)
      NoMethodError:
        undefined method `guess' for #<HangpersonGame:0x00000002949268 @word="dog">
      # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
      # ./spec/hangperson_game_spec.rb:7:in `chars'
      # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
      # ./spec/hangperson_game_spec.rb:120:in `block (3 levels) in <top (required)>'

Finished in 0.17384 seconds (files took 1.59 seconds to load)
18 examples, 0 failures, 18 pending
```

If we then follow the instructions and delete the following segment from line 12 of the hang person spec:

```
, :pending => true
```

we should see the following:

```sh
"/usr/local/rvm/rubies/ruby-2.3.0/bin/ruby" -rrubygems -S "/usr/local/rvm/gems/ruby-2.3.0/gems/rspec-core-3.3.2/exe/rspec" --tty "/home/ubuntu/workspace/hw-sinatra-saas-hangperson/spec/hangperson_game_spec.rb"

HangpersonGame
  new
    takes a parameter and returns a HangpersonGame object (FAILED - 1)
  guessing
    correctly
      changes correct guess list (PENDING: No reason given)
      returns true (PENDING: No reason given)
    incorrectly
      changes wrong guess list (PENDING: No reason given)
      returns true (PENDING: No reason given)
    same letter repeatedly
      does not change correct guess list (PENDING: No reason given)
      does not change wrong guess list (PENDING: No reason given)
      returns false (PENDING: No reason given)
      is case insensitive (PENDING: No reason given)
    invalid
      throws an error when empty (PENDING: No reason given)
      throws an error when not a letter (PENDING: No reason given)
      throws an error when nil (PENDING: No reason given)
  displayed word with guesses
    should be 'b-n-n-' when guesses are 'bn' (PENDING: No reason given)
    should be '------' when guesses are 'def' (PENDING: No reason given)
    should be 'banana' when guesses are 'ban' (PENDING: No reason given)
  game status
    should be win when all letters guessed (PENDING: No reason given)
    should be lose after 7 incorrect guesses (PENDING: No reason given)
    should continue play if neither win nor lose (PENDING: No reason given)

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) HangpersonGame guessing correctly changes correct guess list
     # No reason given
     Failure/Error: @valid = @game.guess('a')
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x00000002eb40e0 @word="garply">
     # ./spec/hangperson_game_spec.rb:26:in `block (4 levels) in <top (required)>'

  2) HangpersonGame guessing correctly returns true
     # No reason given
     Failure/Error: @valid = @game.guess('a')
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x00000002f08320 @word="garply">
     # ./spec/hangperson_game_spec.rb:26:in `block (4 levels) in <top (required)>'

  3) HangpersonGame guessing incorrectly changes wrong guess list
     # No reason given
     Failure/Error: @valid = @game.guess('z')
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x00000002f94c30 @word="garply">
     # ./spec/hangperson_game_spec.rb:39:in `block (4 levels) in <top (required)>'

  4) HangpersonGame guessing incorrectly returns true
     # No reason given
     Failure/Error: @valid = @game.guess('z')
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x00000002f1bc40 @word="garply">
     # ./spec/hangperson_game_spec.rb:39:in `block (4 levels) in <top (required)>'

  5) HangpersonGame guessing same letter repeatedly does not change correct guess list
     # No reason given
     Failure/Error: game.guess(letter)
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x00000002fabf20 @word="garply">
     # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
     # ./spec/hangperson_game_spec.rb:7:in `chars'
     # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
     # ./spec/hangperson_game_spec.rb:52:in `block (4 levels) in <top (required)>'

  6) HangpersonGame guessing same letter repeatedly does not change wrong guess list
     # No reason given
     Failure/Error: game.guess(letter)
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x00000002fa8960 @word="garply">
     # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
     # ./spec/hangperson_game_spec.rb:7:in `chars'
     # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
     # ./spec/hangperson_game_spec.rb:52:in `block (4 levels) in <top (required)>'

  7) HangpersonGame guessing same letter repeatedly returns false
     # No reason given
     Failure/Error: game.guess(letter)
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x00000002fe07e8 @word="garply">
     # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
     # ./spec/hangperson_game_spec.rb:7:in `chars'
     # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
     # ./spec/hangperson_game_spec.rb:52:in `block (4 levels) in <top (required)>'

  8) HangpersonGame guessing same letter repeatedly is case insensitive
     # No reason given
     Failure/Error: game.guess(letter)
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x00000002fcd760 @word="garply">
     # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
     # ./spec/hangperson_game_spec.rb:7:in `chars'
     # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
     # ./spec/hangperson_game_spec.rb:52:in `block (4 levels) in <top (required)>'

  9) HangpersonGame guessing invalid throws an error when empty
     # No reason given
     Failure/Error: expect { @game.guess('') }.to raise_error(ArgumentError)
       expected ArgumentError, got #<NoMethodError: undefined method `guess' for #<HangpersonGame:0x00000003000930 @word="foobar">> with backtrace:
         # ./spec/hangperson_game_spec.rb:78:in `block (5 levels) in <top (required)>'
         # ./spec/hangperson_game_spec.rb:78:in `block (4 levels) in <top (required)>'
     # ./spec/hangperson_game_spec.rb:78:in `block (4 levels) in <top (required)>'

  10) HangpersonGame guessing invalid throws an error when not a letter
      # No reason given
      Failure/Error: expect { @game.guess('%') }.to raise_error(ArgumentError)
        expected ArgumentError, got #<NoMethodError: undefined method `guess' for #<HangpersonGame:0x000000034fb700 @word="foobar">> with backtrace:
          # ./spec/hangperson_game_spec.rb:81:in `block (5 levels) in <top (required)>'
          # ./spec/hangperson_game_spec.rb:81:in `block (4 levels) in <top (required)>'
      # ./spec/hangperson_game_spec.rb:81:in `block (4 levels) in <top (required)>'

  11) HangpersonGame guessing invalid throws an error when nil
      # No reason given
      Failure/Error: expect { @game.guess(nil) }.to raise_error(ArgumentError)
        expected ArgumentError, got #<NoMethodError: undefined method `guess' for #<HangpersonGame:0x0000000350b510 @word="foobar">> with backtrace:
          # ./spec/hangperson_game_spec.rb:84:in `block (5 levels) in <top (required)>'
          # ./spec/hangperson_game_spec.rb:84:in `block (4 levels) in <top (required)>'
      # ./spec/hangperson_game_spec.rb:84:in `block (4 levels) in <top (required)>'

  12) HangpersonGame displayed word with guesses should be 'b-n-n-' when guesses are 'bn'
      # No reason given
      Failure/Error: game.guess(letter)
      NoMethodError:
        undefined method `guess' for #<HangpersonGame:0x0000000354f058 @word="banana">
      # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
      # ./spec/hangperson_game_spec.rb:7:in `chars'
      # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
      # ./spec/hangperson_game_spec.rb:101:in `block (4 levels) in <top (required)>'

  13) HangpersonGame displayed word with guesses should be '------' when guesses are 'def'
      # No reason given
      Failure/Error: game.guess(letter)
      NoMethodError:
        undefined method `guess' for #<HangpersonGame:0x00000003537d18 @word="banana">
      # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
      # ./spec/hangperson_game_spec.rb:7:in `chars'
      # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
      # ./spec/hangperson_game_spec.rb:101:in `block (4 levels) in <top (required)>'

  14) HangpersonGame displayed word with guesses should be 'banana' when guesses are 'ban'
      # No reason given
      Failure/Error: game.guess(letter)
      NoMethodError:
        undefined method `guess' for #<HangpersonGame:0x000000035353b0 @word="banana">
      # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
      # ./spec/hangperson_game_spec.rb:7:in `chars'
      # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
      # ./spec/hangperson_game_spec.rb:101:in `block (4 levels) in <top (required)>'

  15) HangpersonGame game status should be win when all letters guessed
      # No reason given
      Failure/Error: game.guess(letter)
      NoMethodError:
        undefined method `guess' for #<HangpersonGame:0x000000035897d0 @word="dog">
      # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
      # ./spec/hangperson_game_spec.rb:7:in `chars'
      # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
      # ./spec/hangperson_game_spec.rb:112:in `block (3 levels) in <top (required)>'

  16) HangpersonGame game status should be lose after 7 incorrect guesses
      # No reason given
      Failure/Error: game.guess(letter)
      NoMethodError:
        undefined method `guess' for #<HangpersonGame:0x000000035731b0 @word="dog">
      # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
      # ./spec/hangperson_game_spec.rb:7:in `chars'
      # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
      # ./spec/hangperson_game_spec.rb:116:in `block (3 levels) in <top (required)>'

  17) HangpersonGame game status should continue play if neither win nor lose
      # No reason given
      Failure/Error: game.guess(letter)
      NoMethodError:
        undefined method `guess' for #<HangpersonGame:0x00000003570618 @word="dog">
      # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
      # ./spec/hangperson_game_spec.rb:7:in `chars'
      # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
      # ./spec/hangperson_game_spec.rb:120:in `block (3 levels) in <top (required)>'

Failures:

  1) HangpersonGame new takes a parameter and returns a HangpersonGame object
     Failure/Error: expect(@hangpersonGame.word).to eq('glorp')
     NoMethodError:
       undefined method `word' for #<HangpersonGame:0x00000002ec2410 @word="glorp">
     # ./spec/hangperson_game_spec.rb:16:in `block (3 levels) in <top (required)>'

Finished in 0.04773 seconds (files took 0.82283 seconds to load)
18 examples, 1 failure, 17 pending

Failed examples:

rspec ./spec/hangperson_game_spec.rb:13 # HangpersonGame new takes a parameter and returns a HangpersonGame object
```


Now I (Sam) am not the biggest fan of auto test, since I find it unreliable, and I also worry that pedagogically we are hitting the students with reams and reams of output here, and I would much rather get the students into the habit of running the individual tests with commands like:

```sh
bundle exec rspec ./spec/hangperson_game_spec.rb:13
```

and getting them into the habit of running the main `rspec` on ever increasing sets of tests so that they are taking more executive control of the testing process, but each to their own. 

So now the students are expected to try out the two self-check tests in order to understand how to proceed and make the failing test pass.

We can follow the suggestion to add `attr_accessors` to the `lib/hangperson` class as follows:

  
```rb
  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses
```

although it's not the only way, and we might feel that using `attr_accessor` is a bit of a code smell as discussed in the following links:


http://solnic.eu/2012/04/04/get-rid-of-that-code-smell-attributes.html
https://www.reddit.com/r/ruby/comments/rv4yo/get_rid_of_that_code_smell_attributes/
https://github.com/troessner/reek/blob/master/docs/Attribute.md

Please also see the "principle of least privilege": https://en.wikipedia.org/wiki/Principle_of_least_privilege

Note also that the self-check question about instance variables it not actually correct in that the tests are not specifying the hangperson class has instance variables, they are specifying that they have certain instance methods available, so in fact adding `attr_accessor` methods here is breaking the rule of only ever do the absolute minimum to make tests pass.  Perhaps I'm being overly pedantic here, but there is no need to make instance variables to make these tests pass.  The tests will move on in exactly the same way with the following code:

```rb
  def word
    @word
  end
  def guesses
  end
  def wrong_guesses
  end
```

or

```rb
  attr_reader :word
  attr_reader :guesses
  attr_reader :wrong_guesses
```

I guess it all depends what we want the students to be focusing on here.  Is is the nice ruby shorthand with `attr_accessor` (or `attr_reader`) or is it how to ensure to respond to test failures with minimum changes and to understand the side-effects of what they are doing and how they are affecting the encapsulation of the class under study here.

Here we also see that the operation of `autotest` with all the pending tests makes it onerous to compare one test error to the next, which would be must easier if we were running `bundle exec rspec ./spec/hangperson_game_spec.rb:13`.


However you make the change, the tests won't pass immediately - you'll get this new error:

```
Failures:

  1) HangpersonGame new takes a parameter and returns a HangpersonGame object
     Failure/Error: expect(@hangpersonGame.guesses).to eq('')
       
       expected: ""
            got: nil
       
       (compared using ==)
     # ./spec/hangperson_game_spec.rb:17:in `block (3 levels) in <top (required)>'

Finished in 0.04544 seconds (files took 1.18 seconds to load)
18 examples, 1 failure, 17 pending

Failed examples:

rspec ./spec/hangperson_game_spec.rb:13 # HangpersonGame new takes a parameter and returns a HangpersonGame object
```

This is because by default the "getter" specified by attr_reader or attr_accessor will return a nil rather than the expected empty string.  If we've used attr_'s we'll need to set the default response in the constructor.  If we've created explicit methods we can set a default value there and avoid instance variables.  Of course since we're being told to create instance variables it makes sense to follow that advice.

If we adjust the constructor like so:

```rb
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end
```

we should see the test pass, although it is heavily obscured by all the pending tests:

```
HangpersonGame
  new
    takes a parameter and returns a HangpersonGame object
  guessing
    correctly
      changes correct guess list (PENDING: No reason given)
      returns true (PENDING: No reason given)
    incorrectly
      changes wrong guess list (PENDING: No reason given)
      returns true (PENDING: No reason given)
    same letter repeatedly
      does not change correct guess list (PENDING: No reason given)
      does not change wrong guess list (PENDING: No reason given)
      returns false (PENDING: No reason given)
      is case insensitive (PENDING: No reason given)
    invalid
      throws an error when empty (PENDING: No reason given)
      throws an error when not a letter (PENDING: No reason given)
      throws an error when nil (PENDING: No reason given)
  displayed word with guesses
    should be 'b-n-n-' when guesses are 'bn' (PENDING: No reason given)
    should be '------' when guesses are 'def' (PENDING: No reason given)
    should be 'banana' when guesses are 'ban' (PENDING: No reason given)
  game status
    should be win when all letters guessed (PENDING: No reason given)
    should be lose after 7 incorrect guesses (PENDING: No reason given)
    should continue play if neither win nor lose (PENDING: No reason given)

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) HangpersonGame guessing correctly changes correct guess list
     # No reason given
     Failure/Error: @valid = @game.guess('a')
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x00000003516398>
       Did you mean?  guesses
     # ./spec/hangperson_game_spec.rb:26:in `block (4 levels) in <top (required)>'

  2) HangpersonGame guessing correctly returns true
     # No reason given
     Failure/Error: @valid = @game.guess('a')
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x00000003513af8>
       Did you mean?  guesses
     # ./spec/hangperson_game_spec.rb:26:in `block (4 levels) in <top (required)>'

  3) HangpersonGame guessing incorrectly changes wrong guess list
     # No reason given
     Failure/Error: @valid = @game.guess('z')
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x00000003510358>
       Did you mean?  guesses
     # ./spec/hangperson_game_spec.rb:39:in `block (4 levels) in <top (required)>'

  4) HangpersonGame guessing incorrectly returns true
     # No reason given
     Failure/Error: @valid = @game.guess('z')
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x00000003505728>
       Did you mean?  guesses
     # ./spec/hangperson_game_spec.rb:39:in `block (4 levels) in <top (required)>'

  5) HangpersonGame guessing same letter repeatedly does not change correct guess list
     # No reason given
     Failure/Error: game.guess(letter)
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x00000003501ee8>
       Did you mean?  guesses
     # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
     # ./spec/hangperson_game_spec.rb:7:in `chars'
     # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
     # ./spec/hangperson_game_spec.rb:52:in `block (4 levels) in <top (required)>'

  6) HangpersonGame guessing same letter repeatedly does not change wrong guess list
     # No reason given
     Failure/Error: game.guess(letter)
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x000000034fa8a0>
       Did you mean?  guesses
     # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
     # ./spec/hangperson_game_spec.rb:7:in `chars'
     # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
     # ./spec/hangperson_game_spec.rb:52:in `block (4 levels) in <top (required)>'

  7) HangpersonGame guessing same letter repeatedly returns false
     # No reason given
     Failure/Error: game.guess(letter)
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x000000034efb58>
       Did you mean?  guesses
     # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
     # ./spec/hangperson_game_spec.rb:7:in `chars'
     # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
     # ./spec/hangperson_game_spec.rb:52:in `block (4 levels) in <top (required)>'

  8) HangpersonGame guessing same letter repeatedly is case insensitive
     # No reason given
     Failure/Error: game.guess(letter)
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x000000034ec2c8>
       Did you mean?  guesses
     # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
     # ./spec/hangperson_game_spec.rb:7:in `chars'
     # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
     # ./spec/hangperson_game_spec.rb:52:in `block (4 levels) in <top (required)>'

  9) HangpersonGame guessing invalid throws an error when empty
     # No reason given
     Failure/Error: expect { @game.guess('') }.to raise_error(ArgumentError)
       expected ArgumentError, got #<NoMethodError: undefined method `guess' for #<HangpersonGame:0x000000034e4c08>
       Did you mean?  guesses> with backtrace:
         # ./spec/hangperson_game_spec.rb:78:in `block (5 levels) in <top (required)>'
         # ./spec/hangperson_game_spec.rb:78:in `block (4 levels) in <top (required)>'
     # ./spec/hangperson_game_spec.rb:78:in `block (4 levels) in <top (required)>'

  10) HangpersonGame guessing invalid throws an error when not a letter
      # No reason given
      Failure/Error: expect { @game.guess('%') }.to raise_error(ArgumentError)
        expected ArgumentError, got #<NoMethodError: undefined method `guess' for #<HangpersonGame:0x0000000307b7e8>
        Did you mean?  guesses> with backtrace:
          # ./spec/hangperson_game_spec.rb:81:in `block (5 levels) in <top (required)>'
          # ./spec/hangperson_game_spec.rb:81:in `block (4 levels) in <top (required)>'
      # ./spec/hangperson_game_spec.rb:81:in `block (4 levels) in <top (required)>'

  11) HangpersonGame guessing invalid throws an error when nil
      # No reason given
      Failure/Error: expect { @game.guess(nil) }.to raise_error(ArgumentError)
        expected ArgumentError, got #<NoMethodError: undefined method `guess' for #<HangpersonGame:0x0000000306d3a0>
        Did you mean?  guesses> with backtrace:
          # ./spec/hangperson_game_spec.rb:84:in `block (5 levels) in <top (required)>'
          # ./spec/hangperson_game_spec.rb:84:in `block (4 levels) in <top (required)>'
      # ./spec/hangperson_game_spec.rb:84:in `block (4 levels) in <top (required)>'

  12) HangpersonGame displayed word with guesses should be 'b-n-n-' when guesses are 'bn'
      # No reason given
      Failure/Error: game.guess(letter)
      NoMethodError:
        undefined method `guess' for #<HangpersonGame:0x00000003058180>
        Did you mean?  guesses
      # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
      # ./spec/hangperson_game_spec.rb:7:in `chars'
      # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
      # ./spec/hangperson_game_spec.rb:101:in `block (4 levels) in <top (required)>'

  13) HangpersonGame displayed word with guesses should be '------' when guesses are 'def'
      # No reason given
      Failure/Error: game.guess(letter)
      NoMethodError:
        undefined method `guess' for #<HangpersonGame:0x000000030552f0>
        Did you mean?  guesses
      # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
      # ./spec/hangperson_game_spec.rb:7:in `chars'
      # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
      # ./spec/hangperson_game_spec.rb:101:in `block (4 levels) in <top (required)>'

  14) HangpersonGame displayed word with guesses should be 'banana' when guesses are 'ban'
      # No reason given
      Failure/Error: game.guess(letter)
      NoMethodError:
        undefined method `guess' for #<HangpersonGame:0x0000000304e9a0>
        Did you mean?  guesses
      # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
      # ./spec/hangperson_game_spec.rb:7:in `chars'
      # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
      # ./spec/hangperson_game_spec.rb:101:in `block (4 levels) in <top (required)>'

  15) HangpersonGame game status should be win when all letters guessed
      # No reason given
      Failure/Error: game.guess(letter)
      NoMethodError:
        undefined method `guess' for #<HangpersonGame:0x00000003046520>
        Did you mean?  guesses
      # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
      # ./spec/hangperson_game_spec.rb:7:in `chars'
      # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
      # ./spec/hangperson_game_spec.rb:112:in `block (3 levels) in <top (required)>'

  16) HangpersonGame game status should be lose after 7 incorrect guesses
      # No reason given
      Failure/Error: game.guess(letter)
      NoMethodError:
        undefined method `guess' for #<HangpersonGame:0x000000030435a0>
        Did you mean?  guesses
      # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
      # ./spec/hangperson_game_spec.rb:7:in `chars'
      # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
      # ./spec/hangperson_game_spec.rb:116:in `block (3 levels) in <top (required)>'

  17) HangpersonGame game status should continue play if neither win nor lose
      # No reason given
      Failure/Error: game.guess(letter)
      NoMethodError:
        undefined method `guess' for #<HangpersonGame:0x00000003040440>
        Did you mean?  guesses
      # ./spec/hangperson_game_spec.rb:8:in `block in guess_several_letters'
      # ./spec/hangperson_game_spec.rb:7:in `chars'
      # ./spec/hangperson_game_spec.rb:7:in `guess_several_letters'
      # ./spec/hangperson_game_spec.rb:120:in `block (3 levels) in <top (required)>'

Finished in 0.03449 seconds (files took 0.71381 seconds to load)
18 examples, 0 failures, 17 pending
```

So if we continue to follow the instructions we remove pending from more locations.  Immediate confusion may arise as in the next test block we have to remove pending from two locations: lines 22 and 28.  [Note: presumably we could remove the pending from line 22 in the skeleton to avoid this possibility for confusion]

There are also tips about debugging, however this is another place where I would recommend running individual tests.  If you have debug breakpoints and autotest running together then you may end up getting confused about which test run you are on when you catch on the breakpoint.  If you are running a specific test via `rspec spec/hangperson_game_spec.rb:17` then you are always clear.

Anyhow, the next error we encounter if we have removed pending from lines 22 and 28 is as follows:

```
  1) HangpersonGame guessing correctly changes correct guess list
     Failure/Error: @valid = @game.guess('a')
     NoMethodError:
       undefined method `guess' for #<HangpersonGame:0x00000002bab3d0>
       Did you mean?  guesses
     # ./spec/hangperson_game_spec.rb:26:in `block (4 levels) in <top (required)>'
```

and we can change that error by adding the following code (note, we are only adding the code required to change the message, we are specifically not getting involved in trying to work out exactly what this method should do):

```rb
  def guess(letter)
    
  end
```

in which case we get the following errors:

```
Failures:

  1) HangpersonGame guessing correctly changes correct guess list
     Failure/Error: expect(@game.guesses).to eq('a')
       
       expected: "a"
            got: ""
       
       (compared using ==)
     # ./spec/hangperson_game_spec.rb:29:in `block (4 levels) in <top (required)>'

  2) HangpersonGame guessing correctly returns true FIXED
     Expected pending 'No reason given' to fail. No Error was raised.
     # ./spec/hangperson_game_spec.rb:32

  3) HangpersonGame guessing incorrectly returns true FIXED
     Expected pending 'No reason given' to fail. No Error was raised.
     # ./spec/hangperson_game_spec.rb:45

Finished in 0.02363 seconds (files took 0.61241 seconds to load)
18 examples, 3 failures, 14 pending

Failed examples:

rspec ./spec/hangperson_game_spec.rb:28 # HangpersonGame guessing correctly changes correct guess list
rspec ./spec/hangperson_game_spec.rb:32 # HangpersonGame guessing correctly returns true
rspec ./spec/hangperson_game_spec.rb:45 # HangpersonGame guessing incorrectly returns true
```

The following code will fix this error:

```rb
  def guess(letter)
    @guesses << letter
  end
```

At this point we are left with these two failures from what should be failing tests:

```
Failures:

  1) HangpersonGame guessing correctly returns true FIXED
     Expected pending 'No reason given' to fail. No Error was raised.
     # ./spec/hangperson_game_spec.rb:32

  2) HangpersonGame guessing incorrectly returns true FIXED
     Expected pending 'No reason given' to fail. No Error was raised.
     # ./spec/hangperson_game_spec.rb:45

Finished in 0.02946 seconds (files took 0.66428 seconds to load)
18 examples, 2 failures, 14 pending

Failed examples:

rspec ./spec/hangperson_game_spec.rb:32 # HangpersonGame guessing correctly returns true
rspec ./spec/hangperson_game_spec.rb:45 # HangpersonGame guessing incorrectly returns true
```

which is confusing ... but this is because RSpec is expecting these pending tests to fail:

https://stackoverflow.com/questions/25041974/rspec-pending-results-in-falied-test

As of RSpec 3.x pending tests are run and if they pass then a failure is raised.  Perhaps these would be better specified as 'skipped' or the methods should explicitly raise errors.

Given the current skeleton we can just remove pending from these failing tests and these tests will pass and the failure warnings will go away. Note that these failures appeared at this point because we implemented the `guess` instance method and in the process made more than one test pass.  Some of those tests were pending and thus we got a warning.  In the normal TDD flow those tests wouldn't have been written yet, so it wouldn't have been such an issue.

Now let's delete the pending command on line 41 which gives us this output:

```sh
Failures:

  1) HangpersonGame guessing incorrectly changes wrong guess list
     Failure/Error: expect(@game.guesses).to eq('')
       
       expected: ""
            got: "z"
       
       (compared using ==)
     # ./spec/hangperson_game_spec.rb:42:in `block (4 levels) in <top (required)>'

Finished in 0.03392 seconds (files took 1.64 seconds to load)
18 examples, 1 failure, 13 pending

Failed examples:

rspec ./spec/hangperson_game_spec.rb:41 # HangpersonGame guessing incorrectly changes wrong guess list

```

We can pass this test with this code:

```rb
  def guess(letter)
    if word.chars.include? letter
      @guesses << letter
    else
      @wrong_guesses << letter
    end
  end
```

Now let's delete the pending command from line 54 and we get this failure:

```sh
Failures:

  1) HangpersonGame guessing same letter repeatedly does not change correct guess list
     Failure/Error: expect(@game.guesses).to eq('a')
       
       expected: "a"
            got: "aa"
       
       (compared using ==)
     # ./spec/hangperson_game_spec.rb:56:in `block (4 levels) in <top (required)>'

Finished in 0.12577 seconds (files took 1.39 seconds to load)
18 examples, 1 failure, 12 pending

Failed examples:

rspec ./spec/hangperson_game_spec.rb:54 # HangpersonGame guessing same letter repeatedly does not change correct guess list
```

indicating that we want elements in guesses to be unique.  Here I'm tempted to use the Ruby set class, but since we're using attr_reader that would be a little more involved. Instead I can update the code like so:

```rb
  def guess(letter)
    if word.chars.include? letter
      @guesses << letter unless guesses.chars.include? letter
    else
      @wrong_guesses << letter
    end
  end
```

deleting line 58 pending command gives us a related error:

```sh
Failures:

  1) HangpersonGame guessing same letter repeatedly does not change wrong guess list
     Failure/Error: expect(@game.wrong_guesses).to eq('q')
       
       expected: "q"
            got: "qq"
       
       (compared using ==)
     # ./spec/hangperson_game_spec.rb:60:in `block (4 levels) in <top (required)>'

Finished in 0.04451 seconds (files took 0.73739 seconds to load)
18 examples, 1 failure, 11 pending

Failed examples:

rspec ./spec/hangperson_game_spec.rb:58 # HangpersonGame guessing same letter repeatedly does not change wrong guess list
```

which we can fix in a similar fashion:


```rb
  def guess(letter)
    if word.chars.include? letter
      @guesses << letter unless guesses.chars.include? letter
    else
      @wrong_guesses << letter unless wrong_guesses.chars.include? letter
    end
  end
```

We could refactor here since this is rather unDRY, but I'm reluctant to do so until I have a fuller picture of everything's that needed, so I delete the pending statement on line 62 and get this error:

```sh
Failures:

  1) HangpersonGame guessing same letter repeatedly returns false
     Failure/Error: expect(@game.guess('a')).to be false
       
       expected false
            got nil
     # ./spec/hangperson_game_spec.rb:63:in `block (4 levels) in <top (required)>'

Finished in 0.04373 seconds (files took 1.03 seconds to load)
18 examples, 1 failure, 10 pending

Failed examples:

rspec ./spec/hangperson_game_spec.rb:62 # HangpersonGame guessing same letter repeatedly returns false

```

I try this code:

```rb
  def guess(letter)
    if word.chars.include? letter
      if guesses.chars.include? letter
        return false
      else
        @guesses << letter
        return true
      end
    else
      @wrong_guesses << letter unless wrong_guesses.chars.include? letter
    end
    false
  end
```

and get this failure:

```sh
Failures:

  1) HangpersonGame guessing incorrectly returns true
     Failure/Error: expect(@valid).not_to be false
       
       expected not #<FalseClass:0> => false
                got #<FalseClass:0> => false
       
       Compared using equal?, which compares object identity.
     # ./spec/hangperson_game_spec.rb:46:in `block (4 levels) in <top (required)>'

Finished in 0.04752 seconds (files took 0.72713 seconds to load)
18 examples, 1 failure, 10 pending

Failed examples:

rspec ./spec/hangperson_game_spec.rb:45 # HangpersonGame guessing incorrectly returns true

```

which leaves me confused until I review the failing test:

```rb
      before :each do
        @game = HangpersonGame.new('garply')
        @valid = @game.guess('z')
      end
      it 'changes wrong guess list' do
        expect(@game.guesses).to eq('')
        expect(@game.wrong_guesses).to eq('z')
      end
      it 'returns true' do
        expect(@valid).not_to be false
      end
```

and I remember that we have this concept of a "valid" guess, which is a letter than you haven't guessed before.  I recall that that is described in the docs:

> A letter that has already been guessed or is a non-alphabet character is considered "invalid", i.e. it is not a "valid" guess

and recall also that it would be nice if that concept was articulated in test descriptions themselves, and I update my code to the increasingly ugly:

```rb
  def guess(letter)
    if word.chars.include? letter
      if guesses.chars.include? letter
        return false
      else
        @guesses << letter
        return true
      end
    else
      if wrong_guesses.chars.include? letter
        return false
      else
        @wrong_guesses << letter 
        return true
      end
    end
  end
```

and all the tests pass, thinking this will have to change soon as non-alphabetic characters are also invalid, but I will proceed to the next test that I will remove pending from, on line 66 which is expecting case insensitivity and generates this failure:

```sh
Failures:

  1) HangpersonGame guessing same letter repeatedly is case insensitive
     Failure/Error: expect(@game.guess('A')).to be false
       
       expected false
            got true
     # ./spec/hangperson_game_spec.rb:67:in `block (4 levels) in <top (required)>'

Finished in 0.03105 seconds (files took 0.76792 seconds to load)
18 examples, 1 failure, 9 pending

Failed examples:

rspec ./spec/hangperson_game_spec.rb:66 # HangpersonGame guessing same letter repeatedly is case insensitive
```

which I can fix with:

```rb
  def guess(letter)
    letter = letter.downcase
    if word.chars.include? letter
      if guesses.chars.include? letter
        return false
      else
        @guesses << letter
        return true
      end
    else
      if wrong_guesses.chars.include? letter
        return false
      else
        @wrong_guesses << letter 
        return true
      end
    end
  end
```

and I break my own rule about not modifying incoming arguments but I'll refactor later as I want to get all the pending tests passing first.

I delete pending on line 77 and get:

```sh
Failures:

  1) HangpersonGame guessing invalid throws an error when empty
     Failure/Error: expect { @game.guess('') }.to raise_error(ArgumentError)
       expected ArgumentError but nothing was raised
     # ./spec/hangperson_game_spec.rb:78:in `block (4 levels) in <top (required)>'

Finished in 0.04843 seconds (files took 0.96103 seconds to load)
18 examples, 1 failure, 8 pending

Failed examples:

rspec ./spec/hangperson_game_spec.rb:77 # HangpersonGame guessing invalid throws an error when empty

```

That gets fixed like so:

```rb
  def guess(letter)
    raise ArgumentError if letter.empty?
    letter = letter.downcase
```

Deleting line 80 pending gives us:

```sh
Failures:

  1) HangpersonGame guessing invalid throws an error when not a letter
     Failure/Error: expect { @game.guess('%') }.to raise_error(ArgumentError)
       expected ArgumentError but nothing was raised
     # ./spec/hangperson_game_spec.rb:81:in `block (4 levels) in <top (required)>'

Finished in 0.0331 seconds (files took 0.63385 seconds to load)
18 examples, 1 failure, 7 pending

Failed examples:

rspec ./spec/hangperson_game_spec.rb:80 # HangpersonGame guessing invalid throws an error when not a letter

```

which we can pass with:

```rb
  def guess(letter)
    raise ArgumentError if letter.empty? or !(letter =~ /[[:alpha:]]/)
    letter = letter.downcase
```

deleting pending on line 83 gives us:

```sh
Failures:

  1) HangpersonGame guessing invalid throws an error when nil
     Failure/Error: expect { @game.guess(nil) }.to raise_error(ArgumentError)
       expected ArgumentError, got #<NoMethodError: undefined method `empty?' for nil:NilClass> with backtrace:
         # ./lib/hangperson_game.rb:22:in `guess'
         # ./spec/hangperson_game_spec.rb:84:in `block (5 levels) in <top (required)>'
         # ./spec/hangperson_game_spec.rb:84:in `block (4 levels) in <top (required)>'
     # ./spec/hangperson_game_spec.rb:84:in `block (4 levels) in <top (required)>'

Finished in 0.03714 seconds (files took 0.8052 seconds to load)
18 examples, 1 failure, 6 pending

Failed examples:

rspec ./spec/hangperson_game_spec.rb:83 # HangpersonGame guessing invalid throws an error when nil
```

and we can fix that with:

```rb
  def guess(letter)
    raise ArgumentError if  letter.nil? or letter.empty? or !(letter =~ /[[:alpha:]]/)
    letter = letter.downcase
```

Another reason for disliking auto test in c9 is that when you scroll back to look at earlier errors you don't automatically get jumped to the latest output which can be confusing for some users.

But let's move on to delete pending from line 89, which gives us these errors:

```sh
Failures:

  1) HangpersonGame displayed word with guesses should be 'b-n-n-' when guesses are 'bn'
     Failure/Error: expect(@game.word_with_guesses).to eq(displayed)
     NoMethodError:
       undefined method `word_with_guesses' for #<HangpersonGame:0x00000002d0aeb0>
     # ./spec/hangperson_game_spec.rb:102:in `block (4 levels) in <top (required)>'

  2) HangpersonGame displayed word with guesses should be '------' when guesses are 'def'
     Failure/Error: expect(@game.word_with_guesses).to eq(displayed)
     NoMethodError:
       undefined method `word_with_guesses' for #<HangpersonGame:0x00000002d0b3d8>
     # ./spec/hangperson_game_spec.rb:102:in `block (4 levels) in <top (required)>'

  3) HangpersonGame displayed word with guesses should be 'banana' when guesses are 'ban'
     Failure/Error: expect(@game.word_with_guesses).to eq(displayed)
     NoMethodError:
       undefined method `word_with_guesses' for #<HangpersonGame:0x000000028440e8>
     # ./spec/hangperson_game_spec.rb:102:in `block (4 levels) in <top (required)>'

Finished in 0.01775 seconds (files took 0.63723 seconds to load)
18 examples, 3 failures, 3 pending

Failed examples:

rspec ./spec/hangperson_game_spec.rb[1:3:1] # HangpersonGame displayed word with guesses should be 'b-n-n-' when guesses are 'bn'
rspec ./spec/hangperson_game_spec.rb[1:3:2] # HangpersonGame displayed word with guesses should be '------' when guesses are 'def'
rspec ./spec/hangperson_game_spec.rb[1:3:3] # HangpersonGame displayed word with guesses should be 'banana' when guesses are 'ban'


```

we can make at least one of them pass with:

```rb
  def word_with_guesses
    "------"
  end
```

and all of them pass with:

```rb
  def word_with_guesses
    @word.chars.map { |letter| @guesses.chars.include?(letter) ? letter : '-' }.join
  end
```

let's go on deleting the line 111 pending, to give us:

```sh
Failures:

  1) HangpersonGame game status should be win when all letters guessed
     Failure/Error: expect(@game.check_win_or_lose).to eq(:win)
     NoMethodError:
       undefined method `check_win_or_lose' for #<HangpersonGame:0x000000030621f8>
     # ./spec/hangperson_game_spec.rb:113:in `block (3 levels) in <top (required)>'

Finished in 0.01671 seconds (files took 0.74657 seconds to load)
18 examples, 1 failure, 2 pending

Failed examples:

rspec ./spec/hangperson_game_spec.rb:111 # HangpersonGame game status should be win when all letters guessed


```

we can pass that with the following:

```rb
  def check_win_or_lose
    :win
  end
```

notice I'm starting to jump steps here - we can implement just the method with default nil return and see the expectation for :win, but you get the idea.  Doing the above we see we get more warnings about pending tests running:

```
Pending: (Failures listed here are expected and do not affect your suite's status)

  1) HangpersonGame game status should be lose after 7 incorrect guesses
     # No reason given
     Failure/Error: expect(@game.check_win_or_lose).to eq(:lose)
       
       expected: :lose
            got: :win
       
       (compared using ==)
       
       Diff:
       @@ -1,2 +1,2 @@
       -:lose
       +:win
       
     # ./spec/hangperson_game_spec.rb:117:in `block (3 levels) in <top (required)>'

  2) HangpersonGame game status should continue play if neither win nor lose
     # No reason given
     Failure/Error: expect(@game.check_win_or_lose).to eq(:play)
       
       expected: :play
            got: :win
       
       (compared using ==)
       
       Diff:
       @@ -1,2 +1,2 @@
       -:play
       +:win
       
     # ./spec/hangperson_game_spec.rb:121:in `block (3 levels) in <top (required)>'

Finished in 0.04424 seconds (files took 0.81045 seconds to load)
18 examples, 0 failures, 2 pending
```

maybe we should have pending on the whole content here not individual elements?

Let's delete the pending on line 115 so we get:

```sh
Failures:

  1) HangpersonGame game status should be lose after 7 incorrect guesses
     Failure/Error: expect(@game.check_win_or_lose).to eq(:lose)
       
       expected: :lose
            got: :win
       
       (compared using ==)
       
       Diff:
       @@ -1,2 +1,2 @@
       -:lose
       +:win
       
     # ./spec/hangperson_game_spec.rb:117:in `block (3 levels) in <top (required)>'

Finished in 0.03568 seconds (files took 0.79932 seconds to load)
18 examples, 1 failure, 1 pending

Failed examples:

rspec ./spec/hangperson_game_spec.rb:115 # HangpersonGame game status should be lose after 7 incorrect guesses


```

We can pass that with:

```rb
  def check_win_or_lose
    return :lose if @wrong_guesses.length >= 7
    :win
  end
```

Then we can delete the pending on line 119 and get a final failure:

```sh
Failures:

  1) HangpersonGame game status should continue play if neither win nor lose
     Failure/Error: expect(@game.check_win_or_lose).to eq(:play)
       
       expected: :play
            got: :win
       
       (compared using ==)
       
       Diff:
       @@ -1,2 +1,2 @@
       -:play
       +:win
       
     # ./spec/hangperson_game_spec.rb:121:in `block (3 levels) in <top (required)>'

Finished in 0.03589 seconds (files took 0.79256 seconds to load)
18 examples, 1 failure

Failed examples:

rspec ./spec/hangperson_game_spec.rb:119 # HangpersonGame game status should continue play if neither win nor lose


```

which we can then pass with:

```rb
  def check_win_or_lose
    return :lose if @wrong_guesses.length >= 7
    return :win if @word.chars - @guesses.chars == []
    :play
  end
```

and all the tests pass, but we are left with a need to refactor!!!!!

We could refactor the guess method like so:

```rb
  def guess(letter)
    raise ArgumentError if letter.nil? or letter.empty? or !(letter =~ /[[:alpha:]]/)
    letter = letter.downcase
    guess_type_string = word.chars.include?(letter) ? @guesses : @wrong_guesses
    if guess_type_string.chars.include?(letter) 
      return false
    else
      guess_type_string << letter
      return true
    end
  end
```

which is a bit DRYer, and then we could go even further like so:


```rb
  def guess(letter)
    raise ArgumentError if letter.nil? or letter.empty? or !(letter =~ /[[:alpha:]]/)
    letter = letter.downcase
    guess_type_string = word.chars.include?(letter) ? @guesses : @wrong_guesses
    guess_type_string.chars.include?(letter) ? false : guess_type_string << letter
  end

```

and in both cases all the tests pass.  Of course these ternary statements make it all a little difficult to read, so we might be tempted to do the following:

```rb
  def guess(letter)
    raise ArgumentError if unacceptable_guess?(letter)
    letter.downcase!
    storage = where_to_save_guess(letter)
    valid = is_valid_guess?(letter, storage)
    storage << letter if valid
    valid
  end
  
  private
  
  def unacceptable_guess?(letter)
    letter.nil? or letter.empty? or !(letter =~ /[[:alpha:]]/)
  end
  
  def where_to_save_guess(letter)
    word.chars.include?(letter) ? @guesses : @wrong_guesses
  end
  
  def is_valid_guess?(letter, storage)
    !storage.chars.include?(letter)
  end
```

which also passes all the tests, and is arguably a bit more readable, and explains the intent
a bit better.  Of course we've got the general smell here that the code we've been driven to create violates the principle of command-query separation (CQS) whereby the process of making a guess, is also returning an indication of whether the guess is valid.  Ideally we should be able to ask questions about whether a guess is valid repeatedly without having side effects ...

maybe we could add a self-check question about the way in which CQS is violated here, and set a bonus task of how to adjust the code to overcome it?

https://en.wikipedia.org/wiki/Command%E2%80%93query_separation

an alternative refactoring might use sets to store the guesses and wrong guesses ... 







So this section is entirely theory about the design of the app and self-check questions ... ideally students will work through it to improve their understanding of what happens next ...So we've got another chunk of background theory to read, but then we can run the app we've cloned like so:

```
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ cd hw-sinatra-saas-hangperson
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ bundle exec rerun -- rackup -p $PORT -o $IP

09:31:06 [rerun] Hw-sinatra-saas-hangperson launched
[2017-08-07 09:31:08] INFO  WEBrick 1.3.1
[2017-08-07 09:31:08] INFO  ruby 2.3.0 (2015-12-25) [x86_64-linux]
[2017-08-07 09:31:08] INFO  WEBrick::HTTPServer#start: pid=1894 port=8080
/usr/local/rvm/gems/ruby-2.3.0/gems/rerun-0.10.0/lib/rerun/watcher.rb:89:in `adapter': Object#timeout is deprecated, use Timeout.timeout instead.
09:31:09 [rerun] Watching . for **/*.{rb,js,coffee,css,scss,sass,erb,html,haml,ru,yml,slim,md} using Linux adapter
```

Following the instructions (and self-check question) we should see something like:

![](images/Screenshot%202017-08-07%2018.33.40.png)

and we might be tempted to click on "new game" which will lead to this error message:

![](images/Screenshot%202017-08-07%2018.34.01.png)

Now we can deploy to heroku as instructed.

```
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   lib/hangperson_game.rb
        modified:   spec/hangperson_game_spec.rb

no changes added to commit (use "git add" and/or "git commit -a")
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ git add .
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ git commit -m 'ready for heroku!'
[master 520023e] ready for heroku!
 2 files changed, 56 insertions(+), 18 deletions(-)
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ heroku login
Enter your Heroku credentials:
Email: tansaku+c9test@gmail.com
Password: ************
Logged in as tansaku+c9test@gmail.com
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ heroku create hangperson-clean2017
Creating ⬢ hangperson-clean2017... done
https://hangperson-clean2017.herokuapp.com/ | https://git.heroku.com/hangperson-clean2017.git
```

```
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ git push heroku master
Counting objects: 346, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (159/159), done.
Writing objects: 100% (346/346), 156.96 KiB | 0 bytes/s, done.
Total 346 (delta 180), reused 334 (delta 175)
remote: Compressing source files... done.
remote: Building source:
remote: 
remote: -----> Ruby app detected
remote: -----> Compiling Ruby/Rack
remote: -----> Using Ruby version: ruby-2.3.0
remote: -----> Installing dependencies using bundler 1.15.2
remote:        Running: bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin -j4 --deployment
remote:        Fetching gem metadata from https://rubygems.org/.........
remote:        Fetching version metadata from https://rubygems.org/.
remote:        Using bundler 1.15.2
remote:        Fetching rack 1.6.4
remote:        Fetching tilt 2.0.5
remote:        Installing tilt 2.0.5
remote:        Installing rack 1.6.4
remote:        Fetching rack-protection 1.5.3
remote:        Installing rack-protection 1.5.3
remote:        Fetching sinatra 1.4.7
remote:        Installing sinatra 1.4.7
remote:        Fetching sinatra-flash 0.3.0
remote:        Installing sinatra-flash 0.3.0
remote:        Bundle complete! 15 Gemfile dependencies, 6 gems now installed.
remote:        Gems in the groups development and test were not installed.
remote:        Bundled gems are installed into ./vendor/bundle.
remote:        Bundle completed (2.02s)
remote:        Cleaning up the bundler cache.
remote: -----> Detecting rake tasks
remote: 
remote: -----> Discovering process types
remote:        Procfile declares types     -> web
remote:        Default types for buildpack -> console, rake
remote: 
remote: -----> Compressing...
remote:        Done: 17.7M
remote: -----> Launching...
remote:        Released v4
remote:        https://hangperson-clean2017.herokuapp.com/ deployed to Heroku
remote: 
remote: Verifying deploy... done.
To https://git.heroku.com/hangperson-clean2017.git
 * [new branch]      master -> master
```

and note how the error on heroku is displayed a little differently:

![](images/Screenshot%202017-08-07%2018.42.47.png)

because the app is in production mode by default on heroku, rather than development mode on c9


So more self-check questions and then we need to see the cucumber test fail:

```
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ cucumber features/start_new_game.feature
Feature: start new game
  
  As a player
  So I can play Hangperson
  I want to start a new game

  Scenario: I start a new game         # features/start_new_game.feature:7
    Given I am on the home page        # features/step_definitions/game_steps.rb:58
    And I press "New Game"             # features/step_definitions/game_steps.rb:81
    Then I should see "Guess a letter" # features/step_definitions/game_steps.rb:71
      expected to find text "Guess a letter" in "Not Found" (RSpec::Expectations::ExpectationNotMetError)
      ./features/step_definitions/game_steps.rb:74:in `block (2 levels) in <top (required)>'
      ./features/step_definitions/game_steps.rb:7:in `with_scope'
      ./features/step_definitions/game_steps.rb:72:in `/^(?:|I )should see "([^\"]*)"(?: within "([^\"]*)")?$/'
      features/start_new_game.feature:11:in `Then I should see "Guess a letter"'
    And I press "New Game"             # features/step_definitions/game_steps.rb:81
    Then I should see "Guess a letter" # features/step_definitions/game_steps.rb:71

Failing Scenarios:
cucumber features/start_new_game.feature:7 # Scenario: I start a new game

1 scenario (1 failed)
5 steps (1 failed, 2 skipped, 2 passed)
0m0.113s
Coverage report generated for Cucumber Features to /home/ubuntu/workspace/hw-sinatra-saas-hangperson/coverage. 35 / 60 LOC (58.33%) covered.
```

then make the necessary change to the form:

```erb
<form action='/create' method="post">
  <input type="submit" value="New Game"/>
</form>
```

and then see the test pass


```sh
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ cucumber features/start_new_game.feature
Feature: start new game
  
  As a player
  So I can play Hangperson
  I want to start a new game

  Scenario: I start a new game         # features/start_new_game.feature:7
    Given I am on the home page        # features/step_definitions/game_steps.rb:58
    And I press "New Game"             # features/step_definitions/game_steps.rb:81
    Then I should see "Guess a letter" # features/step_definitions/game_steps.rb:71
    And I press "New Game"             # features/step_definitions/game_steps.rb:81
    Then I should see "Guess a letter" # features/step_definitions/game_steps.rb:71

1 scenario (1 passed)
5 steps (5 passed)
0m0.198s
Coverage report generated for Cucumber Features to /home/ubuntu/workspace/hw-sinatra-saas-hangperson/coverage. 44 / 60 LOC (73.33%) covered.
```

Now let's deploy that to heroku, first by committing locally:

```sh
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ git status
On branch master
Your branch is ahead of 'origin/master' by 1 commit.
  (use "git push" to publish your local commits)
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   views/new.erb

no changes added to commit (use "git add" and/or "git commit -a")
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ git diff
diff --git a/views/new.erb b/views/new.erb
index 23f0c8b..1884d4b 100644
--- a/views/new.erb
+++ b/views/new.erb
@@ -1,4 +1,4 @@
 <!-- This form is incomplete--it needs a destination URL as well as a method: -->
-<form method="post">
+<form action='/create' method="post">
   <input type="submit" value="New Game"/>
 </form>
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ git commit -am 'fix new.erb form'
[master 92d8f90] fix new.erb form
 1 file changed, 1 insertion(+), 1 deletion(-)
```

and using to heroku

```sh
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ git push heroku master
Counting objects: 4, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (4/4), done.
Writing objects: 100% (4/4), 371 bytes | 0 bytes/s, done.
Total 4 (delta 3), reused 0 (delta 0)
remote: Compressing source files... done.
remote: Building source:
remote: 
remote: -----> Ruby app detected
remote: -----> Compiling Ruby/Rack
remote: -----> Using Ruby version: ruby-2.3.0
remote: -----> Installing dependencies using bundler 1.15.2
remote:        Running: bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin -j4 --deployment
remote:        Fetching gem metadata from https://rubygems.org/.........
remote:        Fetching version metadata from https://rubygems.org/.
remote:        Using bundler 1.15.2
remote:        Using rack 1.6.4
remote:        Using tilt 2.0.5
remote:        Using rack-protection 1.5.3
remote:        Using sinatra 1.4.7
remote:        Using sinatra-flash 0.3.0
remote:        Bundle complete! 15 Gemfile dependencies, 6 gems now installed.
remote:        Gems in the groups development and test were not installed.
remote:        Bundled gems are installed into ./vendor/bundle.
remote:        Bundle completed (3.50s)
remote:        Cleaning up the bundler cache.
remote: -----> Detecting rake tasks
remote: 
remote: -----> Discovering process types
remote:        Procfile declares types     -> web
remote:        Default types for buildpack -> console, rake
remote: 
remote: -----> Compressing...
remote:        Done: 17.7M
remote: -----> Launching...
remote:        Released v5
remote:        https://hangperson-clean2017.herokuapp.com/ deployed to Heroku
remote: 
remote: Verifying deploy... done.
To https://git.heroku.com/hangperson-clean2017.git
   520023e..92d8f90  master -> master
```


which should allow us to get to this view on heroku:

![](images/Screenshot%202017-08-08%2014.27.21.png)

Now let's update the `guess` code in the Sinatra `app.rb`.  Note that if we run the feature at this point, we'll see a single failure:

```sh
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ cucumber features/guess.feature 
Feature: guess correct letter
  
  As a player playing Hangperson
  So that I can make progress toward the goal
  I want to see when my guess is correct

  Scenario: guess correct letter that occurs once # features/guess.feature:7
    Given I start a new game with word "garply"   # features/step_definitions/game_steps.rb:12
    When I guess "r"                              # features/step_definitions/game_steps.rb:19
    Then I should see "r" within "span.word"      # features/step_definitions/game_steps.rb:71

  Scenario: guess correct letter that occurs multiple times # features/guess.feature:13
    Given I start a new game with word "animal"             # features/step_definitions/game_steps.rb:12
    When I guess "a"                                        # features/step_definitions/game_steps.rb:19
    Then I should see "a---a-" within "span.word"           # features/step_definitions/game_steps.rb:71

  Scenario: guess incorrect letter                 # features/guess.feature:19
    Given I start a new game with word "xylophone" # features/step_definitions/game_steps.rb:12
    When I guess "a"                               # features/step_definitions/game_steps.rb:19
    Then I should see "a" within "span.guesses"    # features/step_definitions/game_steps.rb:71

  Scenario: multiple correct and incorrect guesses # features/guess.feature:25
    Given I start a new game with word "foobar"    # features/step_definitions/game_steps.rb:12
    When I make the following guesses: a,z,x,o     # features/step_definitions/game_steps.rb:25
    Then the word should read "-oo-a-"             # features/step_definitions/game_steps.rb:33
      expected to find text "-oo-a-" in "Play Hangperson! Guess a letter Wrong Guesses: Word so far: ------ Random word generator provided by Watchout4snakes.com -- thanks!" (RSpec::Expectations::ExpectationNotMetError)
      ./features/step_definitions/game_steps.rb:34:in `/^the word should read "(.*)"$/'
      features/guess.feature:29:in `Then the word should read "-oo-a-"'
    And the wrong guesses should include: z,x      # features/step_definitions/game_steps.rb:37

Failing Scenarios:
cucumber features/guess.feature:25 # Scenario: multiple correct and incorrect guesses

4 scenarios (1 failed, 3 passed)
13 steps (1 failed, 1 skipped, 11 passed)
0m0.322s
Coverage report generated for Cucumber Features to /home/ubuntu/workspace/hw-sinatra-saas-hangperson/coverage. 45 / 60 LOC (75.0%) covered.
```

If we update the `guess` method as follows:

```
  post '/guess' do
    letter = params[:guess].to_s[0]
    ### YOUR CODE HERE ###
    
    @game.guess(letter)
    
    redirect '/show'
  end

```

we should see the final test pass:

```sh
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ cucumber features/guess.feature 
Feature: guess correct letter
  
  As a player playing Hangperson
  So that I can make progress toward the goal
  I want to see when my guess is correct

  Scenario: guess correct letter that occurs once # features/guess.feature:7
    Given I start a new game with word "garply"   # features/step_definitions/game_steps.rb:12
    When I guess "r"                              # features/step_definitions/game_steps.rb:19
    Then I should see "r" within "span.word"      # features/step_definitions/game_steps.rb:71

  Scenario: guess correct letter that occurs multiple times # features/guess.feature:13
    Given I start a new game with word "animal"             # features/step_definitions/game_steps.rb:12
    When I guess "a"                                        # features/step_definitions/game_steps.rb:19
    Then I should see "a---a-" within "span.word"           # features/step_definitions/game_steps.rb:71

  Scenario: guess incorrect letter                 # features/guess.feature:19
    Given I start a new game with word "xylophone" # features/step_definitions/game_steps.rb:12
    When I guess "a"                               # features/step_definitions/game_steps.rb:19
    Then I should see "a" within "span.guesses"    # features/step_definitions/game_steps.rb:71

  Scenario: multiple correct and incorrect guesses # features/guess.feature:25
    Given I start a new game with word "foobar"    # features/step_definitions/game_steps.rb:12
    When I make the following guesses: a,z,x,o     # features/step_definitions/game_steps.rb:25
    Then the word should read "-oo-a-"             # features/step_definitions/game_steps.rb:33
    And the wrong guesses should include: z,x      # features/step_definitions/game_steps.rb:37

4 scenarios (4 passed)
13 steps (13 passed)
0m0.274s
Coverage report generated for Cucumber Features to /home/ubuntu/workspace/hw-sinatra-saas-hangperson/coverage. 55 / 61 LOC (90.16%) covered.
```

Note that launchy doesn't work on c9:

https://community.c9.io/t/getting-launchy-gem-to-work-on-cloud9/9896

unless one installs IceWeasel:

```
sudo apt-get install iceweasel
```


So let's follow the instructions to get things all passing:

1.  Pick a new scenario to work on (you should have 2/4 working at this point)
2.  Run the scenario and watch it fail
3.  Develop code that makes each step of the scenario pass
4.  Repeat till all steps passing.

At this point the following should be failing:

```sh
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ bundle exec cucumber -f progress


REMOVED ERROR DETAILS

cucumber features/game_over.feature:7 # Scenario: game over because I guess the word
cucumber features/game_over.feature:13 # Scenario: game over because I run out of guesses
cucumber features/repeated_guess.feature:7 # Scenario: guess correct letter that I have already tried
cucumber features/repeated_guess.feature:15 # Scenario: guess incorrect letter that I have already tried
```

Let's take the first:

```sh
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ bundle exec cucumber features/game_over.feature:7
Feature: game over
  
  As a player playing Hangperson
  So I can get back to my life 
  I want to know when the game is over

  Scenario: game over because I guess the word   # features/game_over.feature:7
    Given I start a new game with word "foobar"  # features/step_definitions/game_steps.rb:12
    When I make the following guesses: f,o,b,a,r # features/step_definitions/game_steps.rb:25
    Then I should see "You Win!"                 # features/step_definitions/game_steps.rb:72
      expected to find text "You Win!" in "Play Hangperson! Guess a letter Wrong Guesses: Word so far: foobar Random word generator provided by Watchout4snakes.com -- thanks!" (RSpec::Expectations::ExpectationNotMetError)
      ./features/step_definitions/game_steps.rb:75:in `block (2 levels) in <top (required)>'
      ./features/step_definitions/game_steps.rb:7:in `with_scope'
      ./features/step_definitions/game_steps.rb:73:in `/^(?:|I )should see "([^\"]*)"(?: within "([^\"]*)")?$/'
      features/game_over.feature:11:in `Then I should see "You Win!"'

Failing Scenarios:
cucumber features/game_over.feature:7 # Scenario: game over because I guess the word

1 scenario (1 failed)
3 steps (1 failed, 2 passed)
0m0.112s
Coverage report generated for Cucumber Features to /home/ubuntu/workspace/hw-sinatra-saas-hangperson/coverage. 55 / 61 LOC (90.16%) covered.
```

So this is a problem with not displaying the winning condition.  If we look at app.rb we see:

```rb
  get '/win' do
    ### YOUR CODE HERE ###
    erb :win # You may change/remove this line
  end
```

the view is already set up for us:

```erb
<h1>You Win!</h1>

<p>
  The word was
  <span class="win"><%= @game.word %></span>.
</p>

<%= erb :new %>

```

Looking at our current guess method in app.rb:

```rb
  post '/guess' do
    letter = params[:guess].to_s[0]
    ### YOUR CODE HERE ###
    
    @game.guess(letter)
    
    redirect '/show'
  end
```

it looks like we are always redirecting to the show method, which has some interesting notes:

```rb
  # Everytime a guess is made, we should eventually end up at this route.
  # Use existing methods in HangpersonGame to check if player has
  # won, lost, or neither, and take the appropriate action.
  # Notice that the show.erb template expects to use the instance variables
  # wrong_guesses and word_with_guesses from @game.
  get '/show' do
    ### YOUR CODE HERE ###
    erb :show # You may change/remove this line
  end
```

Here we might get distracted by adding things we think we need, or the comments hint we need, but let's stay focused on what the test is asking for, which is that we show the win output in appropriate situations.

We have a `check_win_or_lose` method in our hang person game:

```rb
  def check_win_or_lose
    return :lose if @wrong_guesses.length >= 7
    return :win if @word.chars - @guesses.chars == []
    :play
  end
```

let's use that to choose our template ... 

```rb
  get '/show' do
    ### YOUR CODE HERE ###
    state = @game.check_win_or_lose
    state = :show if state == :play
    erb state # You may change/remove this line
  end
```

I could have done less here, as this has probably made some other tests pass, but it's too tempting when the `check_win_or_lose` returns two symbols which match the erb template names.  Checking we should see our test pass:

```sh
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ bundle exec cucumber features/game_over.feature:7
Feature: game over
  
  As a player playing Hangperson
  So I can get back to my life 
  I want to know when the game is over

  Scenario: game over because I guess the word   # features/game_over.feature:7
    Given I start a new game with word "foobar"  # features/step_definitions/game_steps.rb:12
    When I make the following guesses: f,o,b,a,r # features/step_definitions/game_steps.rb:25
    Then I should see "You Win!"                 # features/step_definitions/game_steps.rb:72

1 scenario (1 passed)
3 steps (3 passed)
0m0.089s
Coverage report generated for Cucumber Features to /home/ubuntu/workspace/hw-sinatra-saas-hangperson/coverage. 60 / 63 LOC (95.24%) covered.
```

Let's check for side-effects:

```sh
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ bundle exec cucumber -f progress
........................F....F........

REMOVED ERROR DETAILS

Failing Scenarios:
cucumber features/repeated_guess.feature:7 # Scenario: guess correct letter that I have already tried
cucumber features/repeated_guess.feature:15 # Scenario: guess incorrect letter that I have already tried


10 scenarios (2 failed, 8 passed)
38 steps (2 failed, 36 passed)
0m0.492s
Coverage report generated for Cucumber Features to /home/ubuntu/workspace/hw-sinatra-saas-hangperson/coverage. 61 / 63 LOC (96.83%) covered.
```

So it looks like all our game over tests are passing, and we haven't broken any existing tests.  Let's go on and deal with these repeated guess failures.

```sh
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ bundle exec cucumber features/repeated_guess.feature:7
Feature: guess repeated letter
  
  As a player playing Hangperson
  So that I can avoid wasting guesses on letters I've already tried
  I want to be informed when I guess a letter I've already tried

  Scenario: guess correct letter that I have already tried # features/repeated_guess.feature:7
    Given I start a new game with word "bumblebee"         # features/step_definitions/game_steps.rb:12
    When I guess "b"                                       # features/step_definitions/game_steps.rb:19
    And I guess "b" again                                  # features/step_definitions/game_steps.rb:19
    Then the word should read "b--b--b--"                  # features/step_definitions/game_steps.rb:34
    And I should see "You have already used that letter"   # features/step_definitions/game_steps.rb:72
      expected to find text "You have already used that letter" in "Play Hangperson! Guess a letter Wrong Guesses: Word so far: b--b--b-- Random word generator provided by Watchout4snakes.com -- thanks!" (RSpec::Expectations::ExpectationNotMetError)
      ./features/step_definitions/game_steps.rb:75:in `block (2 levels) in <top (required)>'
      ./features/step_definitions/game_steps.rb:7:in `with_scope'
      ./features/step_definitions/game_steps.rb:73:in `/^(?:|I )should see "([^\"]*)"(?: within "([^\"]*)")?$/'
      features/repeated_guess.feature:13:in `And I should see "You have already used that letter"'

Failing Scenarios:
cucumber features/repeated_guess.feature:7 # Scenario: guess correct letter that I have already tried

1 scenario (1 failed)
5 steps (1 failed, 4 passed)
0m0.091s
Coverage report generated for Cucumber Features to /home/ubuntu/workspace/hw-sinatra-saas-hangperson/coverage. 60 / 63 LOC (95.24%) covered.

```


so we need to display "You have already used that letter" at the appropriate time.  There are comments around app.rb's `guess` method that hint at a solution:


```rb
  # Use existing methods in HangpersonGame to process a guess.
  # If a guess is repeated, set flash[:message] to "You have already used that letter."
  # If a guess is invalid, set flash[:message] to "Invalid guess."
  post '/guess' do
    letter = params[:guess].to_s[0]
    ### YOUR CODE HERE ###
    
    @game.guess(letter)
    
    redirect '/show'
  end
```

so we can fix that with:

```rb
  post '/guess' do
    letter = params[:guess].to_s[0]
    ### YOUR CODE HERE ###
    
    valid = @game.guess(letter)
    flash[:message] = "You have already used that letter." unless valid
    
    redirect '/show'
  end
```

and has the side effect of making all the tests pass:

```sh
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ bundle exec cucumber -f progress
......................................

10 scenarios (10 passed)
38 steps (38 passed)
0m0.493s
Coverage report generated for Cucumber Features to /home/ubuntu/workspace/hw-sinatra-saas-hangperson/coverage. 62 / 64 LOC (96.88%) covered.
```

which is slightly confusing because we haven't done everything suggested, and there seems to be some confusion about whether a repeated letter is different from invalid.  Since here we are setting, you've already used that letter as being based on the "validity" returned by the `guess` method.


Anyhow, we can push this code to heroku:

```sh
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ git status
On branch master
Your branch is ahead of 'origin/master' by 2 commits.
  (use "git push" to publish your local commits)
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   app.rb
        modified:   features/step_definitions/game_steps.rb

no changes added to commit (use "git add" and/or "git commit -a")
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ git commit -am 'all cukes passing'
[master aaa7920] all cukes passing
 2 files changed, 8 insertions(+), 1 deletion(-)
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ git remote -v
heroku  https://git.heroku.com/hangperson-clean2017.git (fetch)
heroku  https://git.heroku.com/hangperson-clean2017.git (push)
origin  https://github.com/saasbook/hw-sinatra-saas-hangperson (fetch)
origin  https://github.com/saasbook/hw-sinatra-saas-hangperson (push)
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ git push heroku master
Counting objects: 6, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (5/5), done.
Writing objects: 100% (6/6), 627 bytes | 0 bytes/s, done.
Total 6 (delta 4), reused 0 (delta 0)
remote: Compressing source files... done.
remote: Building source:
remote: 
remote: -----> Ruby app detected
remote: -----> Compiling Ruby/Rack
remote: -----> Using Ruby version: ruby-2.3.0
remote: -----> Installing dependencies using bundler 1.15.2
remote:        Running: bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin -j4 --deployment
remote:        Fetching gem metadata from https://rubygems.org/.........
remote:        Fetching version metadata from https://rubygems.org/.
remote:        Using bundler 1.15.2
remote:        Using rack 1.6.4
remote:        Using tilt 2.0.5
remote:        Using rack-protection 1.5.3
remote:        Using sinatra 1.4.7
remote:        Using sinatra-flash 0.3.0
remote:        Bundle complete! 15 Gemfile dependencies, 6 gems now installed.
remote:        Gems in the groups development and test were not installed.
remote:        Bundled gems are installed into ./vendor/bundle.
remote:        Bundle completed (1.72s)
remote:        Cleaning up the bundler cache.
remote: -----> Detecting rake tasks
remote: 
remote: -----> Discovering process types
remote:        Procfile declares types     -> web
remote:        Default types for buildpack -> console, rake
remote: 
remote: -----> Compressing...
remote:        Done: 17.7M
remote: -----> Launching...
remote:        Released v6
remote:        https://hangperson-clean2017.herokuapp.com/ deployed to Heroku
remote: 
remote: Verifying deploy... done.
To https://git.heroku.com/hangperson-clean2017.git
   92d8f90..aaa7920  master -> master
```

And we will see that we get 62.5% on the autograder, with output like this:

```
Score: 50/80

Hangperson
  game over
    because the word is guessed [5 points] (FAILED - 1)
    because the guess limit is reached [5 points] (FAILED - 2)
  guessing
    should reveal the letter if it is correct [5 points]
    should reveal the letter if it appears many times [5 points]
    should add to wrong guesses when incorrect [5 points]
    should continuously track right and wrong guesses [5 points]
    should treat guesses as case insensitive [5 points]
  guessing repeats
    should not count as wrong when correct [5 points]
    should not uble count a repeated wrong guess [5 points]
    should not count a repeated wrong guess towards losing [5 points]
    should display an error message [5 points]
  invalid guess
    should label a non-letter as invalid [5 points] (FAILED - 3)
    should label a blank form as invalid [5 points] (FAILED - 4)
  starting a new game
    should take me to the show page [5 points]
  cheating
    should not be able to fake a win [5 points] (FAILED - 5)
    should not be able to fake a loss [5 points] (FAILED - 6)

Failures:

  1) Hangperson game over because the word is guessed [5 points]
     Failure/Error: expect(current_route).to eq("/win")

       expected: "/win"
            got: "/show"

       (compared using ==)

  2) Hangperson game over because the guess limit is reached [5 points]
     Failure/Error: expect(current_route).to eq("/lose")

       expected: "/lose"
            got: "/show"

       (compared using ==)

  3) Hangperson invalid guess should label a non-letter as invalid [5 points]
     Failure/Error:
       page.form_with(:action => '/guess') do |f|
         f.field_with(:name => 'guess').value = letter
       end.click_button

     Mechanize::ResponseCodeError:
       500 => Net::HTTPInternalServerError for http://hangperson-clean2017.herokuapp.com/guess -- unhandled response

  4) Hangperson invalid guess should label a blank form as invalid [5 points]
     Failure/Error:
       page.form_with(:action => '/guess') do |f|
         f.field_with(:name => 'guess').value = letter
       end.click_button

     Mechanize::ResponseCodeError:
       500 => Net::HTTPInternalServerError for http://hangperson-clean2017.herokuapp.com/guess -- unhandled response

  5) Hangperson cheating should not be able to fake a win [5 points]
     Failure/Error: expect(current_route).to eq("/show")

       expected: "/show"
            got: "/win"

       (compared using ==)

  6) Hangperson cheating should not be able to fake a loss [5 points]
     Failure/Error: expect(current_route).to eq("/show")

       expected: "/show"
            got: "/lose"

       (compared using ==)

1 deprecation warning total

Finished in 4.69 seconds (files took 14102 minutes 56 seconds to load)
16 examples, 6 failures

Failed examples:

rspec ./your_code.rb:73 # Hangperson game over because the word is guessed [5 points]
rspec ./your_code.rb:78 # Hangperson game over because the guess limit is reached [5 points]
rspec ./your_code.rb:154 # Hangperson invalid guess should label a non-letter as invalid [5 points]
rspec ./your_code.rb:159 # Hangperson invalid guess should label a blank form as invalid [5 points]
rspec ./your_code.rb:174 # Hangperson cheating should not be able to fake a win [5 points]
rspec ./your_code.rb:179 # Hangperson cheating should not be able to fake a loss [5 points]
```

because we've got extra tests in the grader that checks that are not in our local test suite ...

we can fix the cheating issues by removing the following direct endpoints from app.rb:

```rb
  get '/win' do
    ### YOUR CODE HERE ###
    erb :win # You may change/remove this line
  end
  
  get '/lose' do
    ### YOUR CODE HERE ###
    erb :lose # You may change/remove this line
  end
```

and the "invalid" guesses, but catching the appropriate error:

```rb
  post '/guess' do
    letter = params[:guess].to_s[0]
    ### YOUR CODE HERE ###
    begin  
      valid = @game.guess(letter)
      flash[:message] = "You have already used that letter." unless valid
    rescue ArgumentError
      flash[:message] = "Invalid guess."
    end
    redirect '/show'
  end
```

```sh
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ bundle exec cucumber -f progress
......................................

10 scenarios (10 passed)
38 steps (38 passed)
0m0.613s
Coverage report generated for Cucumber Features to /home/ubuntu/workspace/hw-sinatra-saas-hangperson/coverage. 61 / 62 LOC (98.39%) covered.
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ git commit -am 'defending against cheating and invalid guesses'
[master 4373e17] defending against cheating and invalid guesses
 1 file changed, 6 insertions(+), 14 deletions(-)
c9testaduror:~/workspace/hw-sinatra-saas-hangperson (master) $ git push heroku master
```

This doesn't do all we want on the grader:

```
Score: 60/80

Hangperson
  game over
    because the word is guessed [5 points] (FAILED - 1)
    because the guess limit is reached [5 points] (FAILED - 2)
  guessing
    should reveal the letter if it is correct [5 points]
    should reveal the letter if it appears many times [5 points]
    should add to wrong guesses when incorrect [5 points]
    should continuously track right and wrong guesses [5 points]
    should treat guesses as case insensitive [5 points]
  guessing repeats
    should not count as wrong when correct [5 points]
    should not uble count a repeated wrong guess [5 points]
    should not count a repeated wrong guess towards losing [5 points]
    should display an error message [5 points]
  invalid guess
    should label a non-letter as invalid [5 points]
    should label a blank form as invalid [5 points]
  starting a new game
    should take me to the show page [5 points]
  cheating
    should not be able to fake a win [5 points] (FAILED - 3)
    should not be able to fake a loss [5 points] (FAILED - 4)

Failures:

  1) Hangperson game over because the word is guessed [5 points]
     Failure/Error: expect(current_route).to eq("/win")

       expected: "/win"
            got: "/show"

       (compared using ==)

  2) Hangperson game over because the guess limit is reached [5 points]
     Failure/Error: expect(current_route).to eq("/lose")

       expected: "/lose"
            got: "/show"

       (compared using ==)

  3) Hangperson cheating should not be able to fake a win [5 points]
     Failure/Error: @mech.get(@@BASE_URI + route)

     Mechanize::ResponseCodeError:
       404 => Net::HTTPNotFound for http://hangperson-clean2017.herokuapp.com/win -- unhandled response

  4) Hangperson cheating should not be able to fake a loss [5 points]
     Failure/Error: @mech.get(@@BASE_URI + route)

     Mechanize::ResponseCodeError:
       404 => Net::HTTPNotFound for http://hangperson-clean2017.herokuapp.com/lose -- unhandled response

1 deprecation warning total

Finished in 2.13 seconds (files took 14110 minutes 28 seconds to load)
16 examples, 4 failures

Failed examples:

rspec ./your_code.rb:73 # Hangperson game over because the word is guessed [5 points]
rspec ./your_code.rb:78 # Hangperson game over because the guess limit is reached [5 points]
rspec ./your_code.rb:174 # Hangperson cheating should not be able to fake a win [5 points]
rspec ./your_code.rb:179 # Hangperson cheating should not be able to fake a loss [5 points]
```

since it looks like removing the endpoints for cheating breaks the grader and we still need to handle these routes ... the implication from the grader is that we must redirect ... which implies we need something like this:

```rb
  get '/show' do
    ### YOUR CODE HERE ###
    state = @game.check_win_or_lose
    redirect '/win' if state == :win
    redirect '/lose' if state == :lose
    erb :show # You may change/remove this line
  end
  
  get '/win' do
    ### YOUR CODE HERE ###
    redirect '/show' unless @game.check_win_or_lose == :win
    erb :win # You may change/remove this line
  end
  
  get '/lose' do
    ### YOUR CODE HERE ###
     redirect '/show' unless @game.check_win_or_lose == :lose
    erb :lose # You may change/remove this line
  end
```

and if we push this to heroku ... we get 100% from the autograder:

```
Your submission was recorded at 2017-08-17 04:09:51 +0000 : submission is on time.
Score: 80/80

Hangperson
  game over
    because the word is guessed [5 points]
    because the guess limit is reached [5 points]
  guessing
    should reveal the letter if it is correct [5 points]
    should reveal the letter if it appears many times [5 points]
    should add to wrong guesses when incorrect [5 points]
    should continuously track right and wrong guesses [5 points]
    should treat guesses as case insensitive [5 points]
  guessing repeats
    should not count as wrong when correct [5 points]
    should not uble count a repeated wrong guess [5 points]
    should not count a repeated wrong guess towards losing [5 points]
    should display an error message [5 points]
  invalid guess
    should label a non-letter as invalid [5 points]
    should label a blank form as invalid [5 points]
  starting a new game
    should take me to the show page [5 points]
  cheating
    should not be able to fake a win [5 points]
    should not be able to fake a loss [5 points]

1 deprecation warning total

Finished in 3.11 seconds (files took 14116 minutes 16 seconds to load)
16 examples, 0 failures
```






