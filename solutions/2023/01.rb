# https://adventofcode.com/2023/day/1
module Year2023
  class Day01
    def part_1(input_file)
      lines = input_file.readlines(chomp: true)
      sum_first_and_last_numbers(lines)
    end

    def part_2(input_file)
      lines = input_file.readlines(chomp: true)

      number_words_to_digits(lines)
        .then { sum_first_and_last_numbers(_1) }
    end

    private

    WORDS_TO_DIGITS = %w[one two three four five six seven eight nine].zip(1..9).to_h

    def sum_first_and_last_numbers(lines)
      lines.map { |line|
        line
          .scan(/\d/)
          .then { |nums| [nums.first, nums.last] }
          .join
          .to_i
      }.sum
    end

    def number_words_to_digits(lines)
      lines.map { |line|
        # Must use lookahead due to overlapping number words, e.g. "oneight".
        line.gsub(/(?=(#{WORDS_TO_DIGITS.keys.join("|")}))/) { |_match|
          number_word = $1
          WORDS_TO_DIGITS[number_word]
        }
      }
    end
  end
end
