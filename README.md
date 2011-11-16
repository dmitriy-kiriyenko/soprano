# Soprano

[![The Sopranos](http://i.minus.com/idGXKU.jpeg)](http://www.imdb.com/title/tt0141842/)

Soprano is the set of Capistrano recipes that help me to deploy my
applications.

Soprano by default uses Mongrel cluster (or Passenger) as an application
server, nginx as a web server, MySQL as a database server and git as a SCM.

The latest version of Soprano was inspired by Rubaidh's
[Rubaidhstrano](http://github.com/rubaidh/rubaidhstrano) and some code has
been borrowed from its sources.

## Installation

For Rails 3 add to your `Gemfile`:

    gem 'soprano', :require => false

## Example usage

To start using Soprano you just need to add `require "soprano"` to your
`config/deploy.rb` file and set some variables:

    require "soprano"

    set :application, "set your application name here"
    set :repository,  "set your repository location here"
    set :host,        "set your host here"

    # See soprano/recipes/defaults.rb for defaults

## Features

### Remote

*Sometimes* we need to execute an arbitrary command or script on our
server within the application. To aid with thin, Soprano offers a bunch
of `remote` scripts. For example:

    cap remote:command -s cmd="ls -l" # You'll even get the output

Similar tasks exist for rake, thor and runner. Try `cap -T remote`. Note:
runner does not put to the STDOUT anything.

Don't forget to use `-s` option. Also wrap `cmd=` argument in quotes.
Yeah, this is not comfortable, but it's intentional. Consider it a
syntax vinegar. If you have a repeated task, write a Capistrano recipe
for it. This remote calls are for really occasional tasks.

You also have `cap remote:tail` to tail the application log.

### Other

Readme about other features in process...

## Thanks

- Jamis Buck for [Capistrano](https://github.com/halorgium/capistrano),
- Rubaidh Ltd for their awesome
  [Rubaidhstrano](http://github.com/rubaidh/rubaidhstrano),
- Denis Barushev for [Capone](https://github.com/denis/capone).

## Copyright

Copyright (c) 2011 Dmitriy Kiriyenko. See LICENSE for details.
