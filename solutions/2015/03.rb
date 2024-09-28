# https://adventofcode.com/2015/day/3
module Year2015
  class Day03
    def part_1(input_file)
      moves = input_file.read.chars
      grid = create_grid
      santa = {x: 0, y: 0}

      make_moves!(moves, grid, choose_mover: ->(_i) { santa })

      grid.values.sum { _1.values.compact.count }
    end

    def part_2(input_file)
      moves = input_file.read.chars
      grid = create_grid
      santa = {x: 0, y: 0}
      bot = {x: 0, y: 0}

      make_moves!(moves, grid, choose_mover: ->(i) { i.odd? ? santa : bot })

      grid.values.sum { _1.values.compact.count }
    end

    private

    def create_grid
      grid = Hash.new { |x_hash, x_key|
        x_hash[x_key] = Hash.new { |y_hash, y_key|
          y_hash[y_key] = nil
        }
      }
      grid[0][0] = true

      grid
    end

    def make_moves!(moves, grid, choose_mover:)
      moves.each.with_index do |move, i|
        mover = choose_mover.call(i)

        case move
        when ">" then mover[:x] += 1
        when "<" then mover[:x] -= 1
        when "^" then mover[:y] += 1
        when "v" then mover[:y] -= 1
        end

        grid[mover[:x]][mover[:y]] = true
      end
    end
  end
end
