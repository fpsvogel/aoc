# Puzzle input file management
class PuzzleInput
  def self.load(year, day)
    file_path = input_file_path(year, day)
    download(year, day) if !File.exist? file_path
    file_path
  end

  def self.create_required_directories(year)
    year_directory = File.join("input", year)
    FileUtils.mkdir_p(year_directory) if !Dir.exist?(year_directory)
  end

  def self.input_file_path(year, day)
    padded_day = day.rjust(2, "0")
    File.join("input", year, "#{padded_day}.txt")
  end

  def self.download(year, day)
    aoc_api = AocApi.new(ENV["AOC_COOKIE"])
    input = aoc_api.input(year, day)
    save_input_file(year, day, input)
  end

  def self.save_input_file(year, day, input)
    create_required_directories(year)
    skip_if_exists(input_file_path(year, day)) do
      File.open(input_file_path(year, day), "w") { |f| f.write input }
    end
  end

  def self.skip_if_exists(file)
    if !File.exist? file
      yield
    else
      puts "#{file} already exists, skipping"
    end
  end
end
