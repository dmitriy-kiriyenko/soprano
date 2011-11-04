# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "soprano/version"

Gem::Specification.new do |s|
  s.name        = "soprano"
  s.version     = Capone::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Dmitriy Kiriyenko"]
  s.email       = ["dmitriy.kiriyenko@gmail.com"]
  s.homepage    = "https://github.com/dmitriy-kiriyenko/soprano"
  s.summary     = %q{Soprano is the set of rake tasks and capistrano recipes.}
  s.description = %q{Soprano is the set of rake tasks and capistrano recipes.
                     Use it to avoid writing typical scenarios and maintaining them
                     in favour of configuring your builds and deploys declaratively.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency "capistrano", ">= 2.5.0"
  s.add_development_dependency "rake"
end
