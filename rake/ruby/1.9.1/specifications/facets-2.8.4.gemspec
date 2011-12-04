# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "facets"
  s.version = "2.8.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thomas Sawyer <transfire@gmail.com>"]
  s.date = "2010-04-27"
  s.description = "Facets is the single largest collection of core extension methods\nand standard class additions available for the Ruby programming\nlanguage.\n\nPremium Core Extensions and Standard Additions.\nFacets is a large collection of core extension methods\nand standard additions for the Ruby programming language.\nThe core extensions are unique by virtue of thier atomicity.\nMethods are stored in small, tightly related collections,\nallowing for highly granular control of requirements.\nThe modules include a variety of useful classes, mixins\nand microframeworks, from the Functor to a complete\nAnnotations system."
  s.homepage = "http://rubyworks.github.com/facets"
  s.rdoc_options = ["--title", "Facets API"]
  s.require_paths = ["lib/core", "lib/more"]
  s.rubyforge_project = "facets"
  s.rubygems_version = "1.8.10"
  s.summary = "Premium Core Extensions and Standard Additions"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
