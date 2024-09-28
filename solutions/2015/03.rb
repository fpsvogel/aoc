# https://adventofcode.com/2015/day/3

require "matrix"

module Year2015
  class Day03
    DIRS = {
      ">" => Vector[1, 0],
      "<" => Vector[-1, 0],
      "^" => Vector[0, 1],
      "v" => Vector[0, -1],
    }

    def part_1(input_file)
      directions = input_file.read.chomp
      santa = Vector[0, 0]
      visited = (Set.new << santa)

      directions.each_char do |char|
        visited << (santa += DIRS[char])
      end

      visited.count
    end

    def part_2(input_file)
      directions = input_file.read.chomp
      santa = Vector[0, 0]
      robot = Vector[0, 0]
      visited = (Set.new << santa)

      directions.each_char.each_slice(2) do |santa_char, robot_char|
        visited << (santa += DIRS[santa_char])
        visited << (robot += DIRS[robot_char])
      end

      visited.count
    end
  end
end
