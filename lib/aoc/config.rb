module Aoc
  class Config
    class << self
      attr_reader :editor_command, :aoc_cookie

      def config_filename = "config.yml"
      def default_editor_command = "code"

      def load!
        if !File.exist?(config_filename)
          create_config!
          @files_created = true
        else
          config = File.read(config_filename).then { YAML.load _1 }

          @editor_command = config["editor_command"] || (raise ConfigError, "Missing key `editor_command` in #{config_filename}")
          @aoc_cookie = config["aoc_cookie"] || (raise ConfigError, "Missing key `aoc_cookie` in #{config_filename}")
        end

        init_other_files!

        if @files_created
          puts "✅ Initial files created and committed to a new Git repository.\n\n"
        end
      end

      def refresh_aoc_cookie!
        print "Uh oh, your Advent of Code session cookie has expired or was " \
          "incorrectly entered. "
        config = YAML.load(config_filename)
        @aoc_cookie = input_aoc_cookie
        File.write(config_filename, config_yaml)
      end

      private

      def config_yaml
        {
          editor_command:,
          aoc_cookie:,
        }
        .transform_keys(&:to_s)
        .to_yaml
      end

      def create_config!
        puts "🎄 Welcome to Advent of Code in Ruby! 🎄\n\n"
        puts "Let's start with some configuration.\n\n"

        puts "What's the shell command to start your editor? (default: #{default_editor_command})"
        print PASTEL.green("> ")
        @editor_command = STDIN.gets.strip
        @editor_command = default_editor_command if editor_command.strip.empty?

        puts
        @aoc_cookie = input_aoc_cookie

        File.write(config_filename, config_yaml)
      end

      def input_aoc_cookie
        aoc_cookie = nil

        loop do
          puts "What's your Advent of Code session cookie?"
          puts PASTEL.dark.white("To find it, log in to [Advent of Code](https://adventofcode.com/) and then:")
          puts PASTEL.dark.white("  Firefox: Developer Tools ⇨ Storage tab ⇨ Cookies")
          puts PASTEL.dark.white("  Chrome: Developer Tools ⇨ Application tab ⇨ Cookies")
          print PASTEL.green("> ")

          aoc_cookie = STDIN.gets.strip

          puts

          break unless aoc_cookie.strip.empty?
        end

        aoc_cookie
      end

      def init_other_files!
        if !Dir.exist?("src")
          FileUtils.mkdir_p("src")
          @files_created = true
        end

        if !Dir.exist?("spec")
          FileUtils.mkdir_p("spec")
          @files_created = true
        end

        if !File.exist?(".gitignore")
          File.write(".gitignore", "input/**/*\ninstructions/**/*\nothers/**/*\nconfig.yml\n")
          @files_created = true
        end

        if !File.exist?(".ruby-version")
          File.write(".ruby-version", "3.3.0\n")
          @files_created = true
        end

        if !File.exist?("Gemfile")
          File.write("Gemfile", "source \"https://rubygems.org\"\n\nruby file: \".ruby-version\"\n\n# Gems required by your solutions:\n")
          @files_created = true
        end

        spec_helper_path = File.join("spec", "spec_helper.rb")
        if (!File.exist?(".rspec") || !File.exist?(spec_helper_path))
          rspec_init_output = `rspec --init`
          unless rspec_init_output.match?(/exist\s+spec.spec_helper.rb/)
            original_spec_helper = File.read(spec_helper_path)
            spec_helper_addition = "require \"debug\"\n\nDir[File.join(__dir__, \"..\", \"src\", \"**\", \"*.rb\")].each do |file|\n  require file\nend\n\n"
            File.write(spec_helper_path, spec_helper_addition + original_spec_helper)
          end
          @files_created = true
        end

        git_repo_exists = `git rev-parse --is-inside-work-tree 2> /dev/null`.chomp
        if git_repo_exists != "true"
          `git init`
          `git add .`
          `git commit -m "Initial commit"`
          @files_created = true
        end
      end
    end
  end
end
