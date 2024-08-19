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
      RSpec.describe Year#{year}::Day#{day} do
        let(:input) {
          <<~IN
            something
          IN
        }

        it "solves Part One" do
          expect(subject.part_1(input)).to eq(:todo)
        end

        it "solves Part Two" do
          expect(subject.part_2(input)).to eq(:todo)
        end
      end
    TPL
  end
end
