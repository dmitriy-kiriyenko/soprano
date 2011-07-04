# Soprano

[1]: http://www.imdb.com/title/tt0141842/
[2]: http://i.min.us/idGXKU.jpeg

[![The Sopranos][2]][1]

Soprano is the set of Capistrano recipes that help me to deploy my
applications.

Soprano by default uses Mongrel cluster (or Passenger) as an application
server, nginx as a web server, MySQL as a database server and git as a SCM.

The latest version of Soprano was inspired by Rubaidh's
[Rubaidhstrano](http://github.com/rubaidh/rubaidhstrano) and some code has
been borrowed from its sources.

## Installation

For Rails 3 add to your `Gemfile`:

    gem 'soprano', :require => false, :version => '>= 0.1.0'

## Example usage

To start using Soprano you just need to add `require "soprano"` to your
`config/deploy.rb` file and set some variables:

    require "soprano"

    set :application, "set your application name here"
    set :repository,  "set your repository location here"
    set :host,        "set your host here"

    # See soprano/recipes/defaults.rb for defaults

## Features

### Whenever

Using [whenever](https://github.com/javan/whenever) is as easy as `set`ing `:whenever` to `true`. Just like this:

    set :whenever, true

Whenever will use your application deploy path as crontab identifier.

You may wish to override the command, used to invoke whenever, e.g., to use Bundler:

    set :whenever_command, 'bundle exec whenever'

Other features in process...

## Thanks

- Jamis Buck for [Capistrano](http://github.com/jamis/capistrano),
- Rubaidh Ltd for their awesome
  [Rubaidhstrano](http://github.com/rubaidh/rubaidhstrano).

## Copyright

Copyright (c) 2011 Dmitriy Kiriyenko. See LICENSE for details.
