Hangperson CI
=============

[![Build Status](https://magnum.travis-ci.com/saasbook/hw-sinatra-saas-hangperson-ci.svg?token=CPXPCn5Dy1cwCKsavtqL&branch=master)](https://magnum.travis-ci.com/saasbook/hw-sinatra-saas-hangperson-ci)

Please find instructions for the homework itself at: https://github.com/saasbook/hw-sinatra-saas-hangperson/blob/master/README.md

This is a separate (private) repo that contains the solutions and walkthrough, as well as tests of various aspects of the assignment.

### Current Test running

A working solution example:
```
export HEROKU_URI=hangperson-clean2017.herokuapp.com;  bundle exec rspec autograder/app_spec.rb
```

`HEROKU_URI` would need to be set before running the student submission. This
is what they are told they should be submitting though, so this seems fine.

To make the autograder file for Gradescope:

```
zip -r Autograder.zip * && mv Autograder.zip ~/Desktop
```


### Legacy Test Running

The following approach is what used to work for an old version of the grader that allowed us to grade assignsments from the command line.  However that functionality was removed following the refactoring to use the XQueue gem ...

To bundle install everything on OSX you might first need [[ref][ref]]:
[ref]:https://stackoverflow.com/questions/15577171/missing-library-while-installing-ruby-filemagic-gem-on-linux

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

