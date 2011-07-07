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

Readme about features in process...

## Thanks

- Jamis Buck for [Capistrano](https://github.com/halorgium/capistrano),
- Rubaidh Ltd for their awesome
  [Rubaidhstrano](http://github.com/rubaidh/rubaidhstrano),
- Denis Barushev for [Capone](https://github.com/denis/capone).

## Copyright

Copyright (c) 2011 Dmitriy Kiriyenko. See LICENSE for details.
