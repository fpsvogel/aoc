class SourceFile
  def self.create(year, day)
    source_directory = File.join("solutions", year)
    FileUtils.mkdir_p(source_directory) if !Dir.exist?(source_directory)

    padded_day = day.rjust(2, "0")
    file_path = File.join(source_directory, "#{padded_day}.rb")

    if File.exist?(file_path)
      puts "#{file_path} already exists, skipping"
    else
      File.write(file_path, source(year, day))
    end

    file_path
  end

  def self.source(year, day)
    padded_day = day.rjust(2, "0")

    <<~TPL
      # https://adventofcode.com/#{year}/day/#{day}"
      module Year#{year}
        class Day#{padded_day}
          def part_1(input_file)
            lines = input_file
              .read
              .split("\n")

            nil
          end

          def part_2(input_file)
            lines = input_file
              .read
              .split("\n")

            nil
          end
        end
      end
    TPL
  end
end
