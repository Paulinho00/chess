# -*- encoding: utf-8 -*-
# stub: chess 0.3.4 ruby lib
# stub: ext/chess/extconf.rb

Gem::Specification.new do |s|
  s.name = "chess".freeze
  s.version = "0.3.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "rubygems_mfa_required" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Enrico Pilotto".freeze]
  s.date = "2023-04-26"
  s.description = "A fast chess library that use bitboards to play chess with Ruby.".freeze
  s.email = ["epilotto@gmx.com".freeze]
  s.extensions = ["ext/chess/extconf.rb".freeze]
  s.files = ["ext/chess/extconf.rb".freeze]
  s.homepage = "https://github.com/pioz/chess".freeze
  s.licenses = ["LGPLv3".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5".freeze)
  s.rubygems_version = "3.3.5".freeze
  s.summary = "A fast chess library to play chess with Ruby.".freeze

  s.installed_by_version = "3.3.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["~> 2"])
    s.add_development_dependency(%q<byebug>.freeze, ["~> 11"])
    s.add_development_dependency(%q<codecov>.freeze, ["~> 0"])
    s.add_development_dependency(%q<minitest>.freeze, ["~> 5"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 13"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 1"])
    s.add_development_dependency(%q<rubocop-minitest>.freeze, ["~> 0"])
    s.add_development_dependency(%q<rubocop-performance>.freeze, ["~> 1"])
    s.add_development_dependency(%q<rubocop-rake>.freeze, ["~> 0"])
    s.add_development_dependency(%q<simplecov>.freeze, ["~> 0"])
    s.add_development_dependency(%q<yard>.freeze, [">= 0.9.20"])
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 2"])
    s.add_dependency(%q<byebug>.freeze, ["~> 11"])
    s.add_dependency(%q<codecov>.freeze, ["~> 0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5"])
    s.add_dependency(%q<rake>.freeze, ["~> 13"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 1"])
    s.add_dependency(%q<rubocop-minitest>.freeze, ["~> 0"])
    s.add_dependency(%q<rubocop-performance>.freeze, ["~> 1"])
    s.add_dependency(%q<rubocop-rake>.freeze, ["~> 0"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0"])
    s.add_dependency(%q<yard>.freeze, [">= 0.9.20"])
  end
end
