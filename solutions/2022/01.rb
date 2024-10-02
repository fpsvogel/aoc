# https://adventofcode.com/2022/day/1
module Year2022
  class Day01
    def part_1(input_file)
      input = input_file.read
      elf_calorie_sums(input).max
    end

    def part_2(input_file)
      input = input_file.read
      elf_calorie_sums(input).max(3).sum
    end

    private

    def elf_calorie_sums(input)
      input.split("\n\n").map { |elf|
        elf.split("\n").map(&:to_i).sum
      }
    end
  end
end
