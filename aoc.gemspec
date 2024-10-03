require_relative "lib/aoc/version"

Gem::Specification.new do |spec|
  spec.name          = "aoc"
  spec.version       = Aoc::VERSION
  spec.authors       = ["Felipe Vogel"]
  spec.email         = ["fps.vogel@gmail.com"]

  spec.summary       = "CLI for Advent of Code in Ruby."
  spec.homepage      = "https://github.com/fpsvogel/aoc"
  spec.license       = "MIT"
  spec.required_ruby_version = "~> #{File.read(".ruby-version").strip}"

  spec.add_runtime_dependency "debug", "~> 1.0"
  spec.add_runtime_dependency "httparty", "~> 0.22"
  spec.add_runtime_dependency "pastel", "~> 0.8"
  spec.add_runtime_dependency "reverse_markdown", "~> 2.0"
  spec.add_runtime_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency "thor", "~> 1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/fpsvogel/aoc"
  spec.metadata["changelog_uri"] = "https://github.com/fpsvogel/aoc/blob/main/CHANGELOG.md"

  spec.files = Dir["lib/**/*.rb"]
  spec.bindir = "bin"
  spec.executables << "aoc"
  spec.require_paths = ["lib"]
end
