class SpecFile
  def self.create(year, day)
    spec_directory = File.join("spec", year)
    FileUtils.mkdir_p(spec_directory) if !Dir.exist?(spec_directory)

    padded_day = day.rjust(2, "0")
    file_path = File.join(spec_directory, "#{padded_day}_spec.rb")

    if File.exist?(file_path)
      puts "#{file_path} already exists, skipping"
    else
      File.write(file_path, source(year, day))
    end
  end

  def self.source(year, day)
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
