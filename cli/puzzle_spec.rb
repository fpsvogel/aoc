# Manage a solution's spec file for a given day
class PuzzleSpec
  def self.spec_source_directory(year)
    File.join("spec", year)
  end

  def self.spec_source_path(year, day)
    padded_day = day.rjust(2, "0")
    File.join(spec_source_directory(year), "#{padded_day}_spec.rb")
  end

  def self.spec_source(year, day)
    padded_day = day.rjust(2, "0")

    <<~TPL
      RSpec.describe Year#{year}::Day#{padded_day} do
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
