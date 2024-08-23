# https://adventofcode.com/2021/day/2
module Year2021
  class Day02
    def part_1(input_path)
      moves = File.readlines(input_path)
        .map(&:split)
        .map { [_1, _2.to_i] }
      x, y = 0, 0

      moves.each do |direction, amount|
        case direction
        when "forward" then x += amount
        when "down" then y += amount
        when "up" then y -= amount
        end
      end

      x * y
    end

    def part_2(input_path)
      moves = File.readlines(input_path)
        .map(&:split)
        .map { [_1, _2.to_i] }
      aim, x, y = 0, 0, 0

      moves.each do |direction, amount|
        case direction
        when "forward" then x += amount and y += amount * aim
        when "down" then aim += amount
        when "up" then aim -= amount
        end
      end

      x * y
    end
  end
end
