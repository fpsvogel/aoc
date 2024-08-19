# Manage a solution's spec file for a given day
class PuzzleSpec
  def self.spec_source_directory(year)
    File.join('spec', year)
  end

  def self.spec_source_path(year, day)
    day = Day.pad(day)
    File.join(spec_source_directory(year), "#{day}_spec.rb")
  end

  def self.spec_source(year, day)
    day = Day.pad(day)

    <<~TPL
      require 'spec_helper'

      RSpec.describe Year#{year}::Day#{day} do
        it "solves part1" do
          d = Year#{year}::Day#{day}.new
          expect(d.part1('some_input')).to eq('expected_result')
        end

        it "solves part2" do
          d = Year#{year}::Day#{day}.new
          expect(d.part2('some_input')).to eq(nil)
        end
      end
    TPL
  end
end
