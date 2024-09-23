# https://adventofcode.com/2021/day/3
module Year2021
  class Day03
    def part_1(input_file)
      columns = input_file.readlines(chomp: true).map(&:chars).transpose

      number_from_most_common_bits = columns
        .map(&:tally)
        .map { _1.max_by(&:last).first }
        .join
        .to_i(2)
      ones_complement = number_from_most_common_bits.to_s(2).tr("10", "01").to_i(2)

      gamma, epsilon = number_from_most_common_bits, ones_complement
      gamma * epsilon
    end

    # Inspired by https://github.com/eregon/adventofcode/blob/master/2021/3b.rb
    def part_2(input_file)
      numbers = input_file.readlines(chomp: true)

      oxygen = rating(:max, numbers)
      co2 = rating(:min, numbers)

      oxygen * co2
    end

    private

    CRITERIA = {
      max: {-1 => "1", 0 => "1", 1 => "0"},
      min: {-1 => "0", 0 => "0", 1 => "1"},
    }

    # @param numbers [Array<String>] binary numbers
    # @param frequency [:max, :min]
    def rating(frequency, numbers, i = 0)
      return numbers.first.to_i(2) if numbers.count == 1

      column = numbers.map { _1[i] }
      zeros, ones = column.tally.values_at("0", "1")
      digit_to_keep = CRITERIA[frequency][zeros <=> ones]
      numbers = numbers.select { _1[i] == digit_to_keep }
      rating(frequency, numbers, i + 1)
    end
  end
end
