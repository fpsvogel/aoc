require 'benchmark'
require 'clipboard'

# Manage a solution's source file for a given day
class PuzzleSource
  def self.create_puzzle(year, day)
    padded_day = day.rjust(2, "0")
    Module.const_get("Year#{year}").const_get("Day#{padded_day}").new
  rescue NameError
    puts 'There is no solution for this puzzle'
  end

  def self.run_part(part_name)
    has_result = false
    t = Benchmark.realtime do
      answer = yield
      if !answer.nil?
        puts "Result for #{part_name}:"
        puts answer
        Clipboard.copy(answer)
        has_result = true
      else
        puts "no result for #{part_name}"
      end
    end

    if has_result
      puts "(obtained in #{t} seconds)"
    end
  end

  def self.puzzle_source_directory(year)
    File.join('solutions', year)
  end

  def self.puzzle_source_path(year, day)
    padded_day = day.rjust(2, "0")
    File.join(puzzle_source_directory(year), "#{padded_day}.rb")
  end

  def self.puzzle_source(year, day)
    padded_day = day.rjust(2, "0")

    <<~TPL
      # https://adventofcode.com/#{year}/day/#{day}"
      module Year#{year}
        class Day#{padded_day}
          def part_1(input_path)
            lines = File.readlines(input_path)

            nil
          end

          def part_2(input_path)
            lines = File.readlines(input_path)

            nil
          end
        end
      end
    TPL
  end
end
