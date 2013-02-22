# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-zendesk/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-zendesk"
  s.version     = OmniAuth::Zendesk::VERSION
  s.authors     = ["Thomas Stachl"]
  s.email       = ["tom@desk.com"]
  s.homepage    = "https://github.com/tstachl/omniauth-zendesk"
  s.summary     = %q{OmniAuth strategy for Zendesk}
  s.description = %q{OmniAuth strategy for Zendesk}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_runtime_dependency 'omniauth', '> 1.0'
  s.add_runtime_dependency 'zendesk_api', '> 0.2.2'
  
  s.add_development_dependency 'rspec', '> 2.7'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'webmock'
end