lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "prettyrubyism/version"

Gem::Specification.new do |spec|
  spec.name          = "prettyrubyism"
  spec.version       = PrettyRubyism::VERSION
  spec.authors       = ["seaki"]
  spec.email         = ["seaki@sastudio.jp"]
  spec.description   = 'All about "PrettyRhythm".'
  spec.summary       = 'All about "PrettyRhythm".'
  spec.homepage      = "https://github.com/seaki/prettyrubyism"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 2.2.2"

  spec.files = `git ls-files`.split($INPUT_RECORD_SEPARATOR)

  %w[examples/].each do |exclude_dir|
    spec.files.reject! {|filename| filename.start_with?(exclude_dir) }
  end

  spec.executables   = spec.files.grep(%r{^bin/}) {|f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 5.0.0"
  spec.add_dependency "hashie", ">= 2.0.5"
  spec.add_dependency "sengiri_yaml", ">= 0.0.2"

  spec.add_development_dependency "bundler", ">= 1.3.5"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 1.0.0"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "delorean"
  spec.add_development_dependency "onkcop", "0.53.0.0"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-collection_matchers"
  spec.add_development_dependency "rspec-its"
  spec.add_development_dependency "rspec-parameterized", ">= 0.3.2"
  spec.add_development_dependency "rubocop", "0.53.0"
  spec.add_development_dependency "rubocop-rspec", "1.25.1"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "yard"
end
