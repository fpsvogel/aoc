require 'benchmark'
require 'clipboard'

# Manage a solution's source file for a given day
class PuzzleSource
  def self.create_puzzle(year, day)
    padded_day = Day.pad(day)
    begin
      Module.const_get("Year#{year}").const_get("Day#{padded_day}").new
    rescue NameError
      puts 'There is no solution for this puzzle'
    end
  end

  def self.run_part(part_name, url)
    has_result = false
    t = Benchmark.realtime do
      solution = yield
      if !solution.nil?
        puts "Result for #{part_name}:"
        puts solution
        Clipboard.copy(solution)
        has_result = true
      else
        puts "no result for #{part_name}"
      end
    end

    if has_result
      puts "(obtained in #{t} seconds)"
      puts url
    end
  end

  def self.puzzle_source_directory(year)
    File.join('solutions', year)
  end

  def self.puzzle_source_path(year, day)
    day = Day.pad(day)
    File.join(puzzle_source_directory(year), "#{day}.rb")
  end

  def self.puzzle_source(year, day)
    day = Day.pad(day)

    <<~TPL
      module Year#{year}
        class Day#{day}
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
