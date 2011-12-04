# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "panda"
  s.version = "1.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pandastream"]
  s.date = "2011-10-18"
  s.description = "Panda Client"
  s.email = ["info@pandastream.com"]
  s.homepage = "http://github.com/pandastream/panda_gem"
  s.require_paths = ["lib"]
  s.rubyforge_project = "panda"
  s.rubygems_version = "1.8.10"
  s.summary = "Panda Client"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ruby-hmac>, [">= 0.3.2"])
      s.add_runtime_dependency(%q<faraday>, [">= 0.7.0"])
      s.add_runtime_dependency(%q<typhoeus>, [">= 0"])
      s.add_runtime_dependency(%q<multi_json>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<timecop>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["= 2.4.0"])
      s.add_development_dependency(%q<webmock>, [">= 0"])
    else
      s.add_dependency(%q<ruby-hmac>, [">= 0.3.2"])
      s.add_dependency(%q<faraday>, [">= 0.7.0"])
      s.add_dependency(%q<typhoeus>, [">= 0"])
      s.add_dependency(%q<multi_json>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<timecop>, [">= 0"])
      s.add_dependency(%q<rspec>, ["= 2.4.0"])
      s.add_dependency(%q<webmock>, [">= 0"])
    end
  else
    s.add_dependency(%q<ruby-hmac>, [">= 0.3.2"])
    s.add_dependency(%q<faraday>, [">= 0.7.0"])
    s.add_dependency(%q<typhoeus>, [">= 0"])
    s.add_dependency(%q<multi_json>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<timecop>, [">= 0"])
    s.add_dependency(%q<rspec>, ["= 2.4.0"])
    s.add_dependency(%q<webmock>, [">= 0"])
  end
end
