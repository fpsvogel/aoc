require "bundler/gem_tasks"
require_relative "lib/aoc/version"

task default: :install

gem_name = "aoc"

task :build do
  `gem build #{gem_name}.gemspec`
end

task :install => :build do
  `gem install #{gem_name}-#{Aoc::VERSION}.gem`
  `rm -rf pkg`
  `rm *.gem`
end

task :publish => :build do
  `gem push #{gem_name}-#{Aoc::VERSION}.gem`
  `rm -rf pkg`
  `rm *.gem`
end
