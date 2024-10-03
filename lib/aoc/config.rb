module Aoc
  class Config
    class << self
      attr_reader :editor_command, :aoc_cookie

      def config_path = File.join(ENV["HOME"], ".aoc.yml")

      def load!
        if !File.exist?(config_path)
          create_config!
        else
          config = File.read(config_path).then { YAML.load _1 }

          @editor_command = config["editor_command"] || (raise ConfigError, "Missing key `editor_command` in #{config_path}")
          @aoc_cookie = config["aoc_cookie"] || (raise ConfigError, "Missing key `aoc_cookie` in #{config_path}")

          init_files!
        end
      end

      def refresh_aoc_cookie!
        config = YAML.load(config_path)
        @aoc_cookie = input_aoc_cookie
        File.write(config_path, config_yaml)
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
        puts "What's the shell command to start your editor? (default: #{default_editor_command})"
        @editor_command = STDIN.gets.strip
        @editor_command = default_editor_command if editor_command.strip.empty?

        @aoc_cookie = input_aoc_cookie

        File.write(config_path, config_yaml)
      end

      def input_aoc_cookie
        aoc_cookie = nil

        loop do
          puts "What's your Advent of Code session cookie?"
          puts PASTEL.dark.white("To find it, log in to [Advent of Code](https://adventofcode.com/) and then:")
          puts PASTEL.dark.white("  Firefox: Developer Tools ⇨ Storage tab ⇨ Cookies")
          puts PASTEL.dark.white("  Chrome: Developer Tools ⇨ Application tab ⇨ Cookies")

          aoc_cookie = STDIN.gets.strip

          break unless aoc_cookie.strip.empty?
        end

        aoc_cookie
      end

      def consent_to_create_files
        return true if @consented_to_create_files

        puts "Files will be created in the current directory #{Dir.pwd}. Continue? (Y/n)"
        continue = STDIN.gets.strip.downcase
        exit unless continue == "y" || continue == ""
        @consented_to_create_files = true
      end

      def init_files!
        if !Dir.exist?("src") && consent_to_create_files
          FileUtils.mkdir_p("src")
        end

        if !Dir.exist?("spec") && consent_to_create_files
          FileUtils.mkdir_p("spec")
        end

        if !File.exist?(".gitignore") && consent_to_create_files
          File.write(".gitignore", "input/**/*\ninstructions/**/*\nothers/**/*\n")
        end

        if !File.exist?(".ruby-version") && consent_to_create_files
          File.write(".ruby-version", "3.3.0\n")
        end

        if !File.exist?("Gemfile") && consent_to_create_files
          File.write("Gemfile", "source \"https://rubygems.org\"\n\nruby file: \".ruby-version\"\n\n# Gems required by your solutions:\n")
        end

        spec_helper_path = File.join("spec", "spec_helper.rb")
        if (!File.exist?(".rspec") || !File.exist?(spec_helper_path)) && consent_to_create_files
          rspec_init_output = `rspec --init`
          unless rspec_init_output.match?(/exist\s+spec.spec_helper.rb/)
            original_spec_helper = File.read(spec_helper_path)
            spec_helper_addition = "require \"debug\"\n\nDir[File.join(__dir__, \"..\", \"src\", \"**\", \"*.rb\")].each do |file|\n  require file\nend\n\n"
            File.write(spec_helper_path, spec_helper_addition + original_spec_helper)
          end
        end

        git_repo_exists = `git rev-parse --is-inside-work-tree 2> /dev/null`.chomp
        if git_repo_exists != "true" && consent_to_create_files
          `git init`
          `git add .`
          `git commit -m "Initial commit"`
        end
      end
    end
  end
end
