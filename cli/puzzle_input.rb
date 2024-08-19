# Puzzle input file management
class PuzzleInput
  def self.load(year, day)
    file_path = puzzle_path(year, day)
    download(year, day) if !File.exist? file_path
    File.read(file_path)
  end

  def self.create_required_directories(year)
    year_directory = File.join(ENV['AOC_INPUT_DIRECTORY'], year)
    FileUtils.mkdir_p(year_directory) if !Dir.exist?(year_directory)
  end

  def self.puzzle_path(year, day)
    day = Day.pad(day)
    File.join(ENV['AOC_INPUT_DIRECTORY'], year, "day-#{day}")
  end

  def self.download(year, day)
    aoc_api = AocApi.new(year, ENV['AOC_COOKIE'])
    content = aoc_api.day(day)
    save_puzzle(year, day, content)
  end

  def self.save_puzzle(year, day, content)
    create_required_directories(year)
    skip_if_exists(puzzle_path(year, day)) do
      File.open(puzzle_path(year, day), 'w') { |f| f.write content }
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
