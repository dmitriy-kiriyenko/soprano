# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "capone/version"

Gem::Specification.new do |s|
  s.name        = "dimkiriyenko-capone"
  s.version     = Capone::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Denis Barushev", "Dmitriy Kiriyenko"]
  s.email       = ["barushev@gmail.com", "dmitriy.kiriyenko@gmail.com"]
  s.homepage    = "https://github.com/dmitriy-kiriyenko/capone"
  s.summary     = %q{Capone is the set of rake tasks and capistrano recipes.}
  s.description = %q{Capone is the set of rake tasks and capistrano recipes.
                     Use it to avoid writing typical scenarios and maintaining them
                     in favour of configuring your builds and deploys declaratively.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency "capistrano", ">= 2.5.0"
end
