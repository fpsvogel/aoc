# https://adventofcode.com/2015/day/2
module Year2015
  class Day02
    def part_1(input_file)
      edges = input_file.readlines(chomp: true)
        .map { |line| line.split("x").map(&:to_i) }

      edges.sum { |l, w, h|
        faces = [l*w, w*h, h*l]
        faces.sum * 2 + faces.min
      }
    end

    def part_2(input_file)
      edges = input_file.readlines(chomp: true)
        .map { |line| line.split("x").map(&:to_i) }

      edges.sum { |edges|
        edges.min(2).sum * 2 + edges.reduce(:*)
      }
    end
  end
end
