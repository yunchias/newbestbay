# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "asf-soap-adapter"
  s.version = "1.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Doug Chasman", "Luigi Montanez", "Senthil Nayagam", "Justin Ball", "Jesse Hallett", "Andrew Freeberg", "Blaine Schanfeldt", "Matte Edens", "Raymond Gao"]
  s.date = "2011-03-14"
  s.description = "ASF-Soap-Adapter is an improved version of ActiveSalesforce (ASF) is a Rails connection adapter that provides direct access to Salesforce.com hosted data and metadata via the ActiveRecord model layer. Objects, fields, and relationships are all auto surfaced as active record attributes and rels. It has been patched to V20 of the Web Services API and has support Chatter model."
  s.email = "raygao2000@yahoo.com"
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = ["LICENSE", "README.rdoc"]
  s.homepage = "http://github.com/raygao/asf-soap-adapter"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "ASF-Soap-Adapter is an improved version of the ActiveSalesforce (ASF) Adapter with support Chatter and general wrapper object."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rforce>, [">= 0.6"])
      s.add_runtime_dependency(%q<builder>, [">= 1.2.4"])
      s.add_runtime_dependency(%q<hpricot>, [">= 0.8.2"])
      s.add_runtime_dependency(%q<facets>, ["= 2.8.4"])
      s.add_runtime_dependency(%q<oauth>, ["= 0.4.4"])
    else
      s.add_dependency(%q<rforce>, [">= 0.6"])
      s.add_dependency(%q<builder>, [">= 1.2.4"])
      s.add_dependency(%q<hpricot>, [">= 0.8.2"])
      s.add_dependency(%q<facets>, ["= 2.8.4"])
      s.add_dependency(%q<oauth>, ["= 0.4.4"])
    end
  else
    s.add_dependency(%q<rforce>, [">= 0.6"])
    s.add_dependency(%q<builder>, [">= 1.2.4"])
    s.add_dependency(%q<hpricot>, [">= 0.8.2"])
    s.add_dependency(%q<facets>, ["= 2.8.4"])
    s.add_dependency(%q<oauth>, ["= 0.4.4"])
  end
end
