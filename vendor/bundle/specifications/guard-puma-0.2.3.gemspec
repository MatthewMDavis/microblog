# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "guard-puma"
  s.version = "0.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jesse Cooke"]
  s.date = "2013-06-14"
  s.email = ["jesse@jc00ke.com"]
  s.homepage = "https://github.com/jc00ke/guard-puma"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Restart puma when files change"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<guard>, [">= 1.0.1"])
      s.add_runtime_dependency(%q<rb-inotify>, [">= 0"])
      s.add_runtime_dependency(%q<libnotify>, [">= 0"])
      s.add_runtime_dependency(%q<puma>, [">= 0"])
      s.add_development_dependency(%q<rake>, ["~> 0.9.2.2"])
      s.add_development_dependency(%q<rspec>, ["~> 2.10.0"])
      s.add_development_dependency(%q<guard-rspec>, ["~> 0.7.0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
    else
      s.add_dependency(%q<guard>, [">= 1.0.1"])
      s.add_dependency(%q<rb-inotify>, [">= 0"])
      s.add_dependency(%q<libnotify>, [">= 0"])
      s.add_dependency(%q<puma>, [">= 0"])
      s.add_dependency(%q<rake>, ["~> 0.9.2.2"])
      s.add_dependency(%q<rspec>, ["~> 2.10.0"])
      s.add_dependency(%q<guard-rspec>, ["~> 0.7.0"])
      s.add_dependency(%q<pry>, [">= 0"])
    end
  else
    s.add_dependency(%q<guard>, [">= 1.0.1"])
    s.add_dependency(%q<rb-inotify>, [">= 0"])
    s.add_dependency(%q<libnotify>, [">= 0"])
    s.add_dependency(%q<puma>, [">= 0"])
    s.add_dependency(%q<rake>, ["~> 0.9.2.2"])
    s.add_dependency(%q<rspec>, ["~> 2.10.0"])
    s.add_dependency(%q<guard-rspec>, ["~> 0.7.0"])
    s.add_dependency(%q<pry>, [">= 0"])
  end
end
