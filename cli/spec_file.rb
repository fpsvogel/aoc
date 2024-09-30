class SpecFile
  def self.create(year, day, notify_exists: true)
    spec_directory = File.join("spec", year)
    FileUtils.mkdir_p(spec_directory) if !Dir.exist?(spec_directory)

    padded_day = day.rjust(2, "0")
    file_path = File.join(spec_directory, "#{padded_day}_spec.rb")

    if File.exist?(file_path)
      puts "Already exists: #{file_path}" if notify_exists
    else
      File.write(file_path, source(year, day))
    end

    file_path
  end

  def self.source(year, day)
    padded_day = day.rjust(2, "0")

    <<~TPL
      RSpec.describe Year#{year}::Day#{padded_day} do
        let(:input) {
          StringIO.new(
            <<~IN
              something
            IN
          )
        }

        it "solves Part One" do
          expect(subject.part_1(input)).to eq(:todo)
        end

        xit "solves Part Two" do
          expect(subject.part_2(input)).to eq(:todo)
        end
      end
    TPL
  end
end
