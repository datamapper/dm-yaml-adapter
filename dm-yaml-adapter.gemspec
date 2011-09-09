# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "dm-yaml-adapter"
  s.version = "1.2.0.rc1"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Kubb"]
  s.date = "2011-09-09"
  s.description = "YAML Adapter for DataMapper"
  s.email = "dan.kubb@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE"
  ]
  s.files = [
    "Gemfile",
    "LICENSE",
    "Rakefile",
    "VERSION",
    "dm-yaml-adapter.gemspec",
    "lib/dm-yaml-adapter.rb",
    "lib/dm-yaml-adapter/adapter.rb",
    "lib/dm-yaml-adapter/core_ext/class.rb",
    "lib/dm-yaml-adapter/spec/setup.rb",
    "spec/adapter_spec.rb",
    "spec/rcov.opts",
    "spec/spec.opts",
    "spec/spec_helper.rb",
    "tasks/spec.rake",
    "tasks/yard.rake",
    "tasks/yardstick.rake"
  ]
  s.homepage = "http://github.com/datamapper/dm-yaml-adapter"
  s.require_paths = ["lib"]
  s.rubyforge_project = "datamapper"
  s.rubygems_version = "1.8.10"
  s.summary = "YAML Adapter for DataMapper"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dm-core>, ["~> 1.2.0.rc1"])
      s.add_development_dependency(%q<dm-migrations>, ["~> 1.2.0.rc1"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<rake>, ["~> 0.9.2"])
      s.add_development_dependency(%q<rspec>, ["~> 1.3.2"])
    else
      s.add_dependency(%q<dm-core>, ["~> 1.2.0.rc1"])
      s.add_dependency(%q<dm-migrations>, ["~> 1.2.0.rc1"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<rake>, ["~> 0.9.2"])
      s.add_dependency(%q<rspec>, ["~> 1.3.2"])
    end
  else
    s.add_dependency(%q<dm-core>, ["~> 1.2.0.rc1"])
    s.add_dependency(%q<dm-migrations>, ["~> 1.2.0.rc1"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<rake>, ["~> 0.9.2"])
    s.add_dependency(%q<rspec>, ["~> 1.3.2"])
  end
end

