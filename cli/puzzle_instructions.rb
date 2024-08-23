require "reverse_markdown"

# Puzzle instructions file management
# This file is mostly a copy of cli/puzzle_input.rb
class PuzzleInstructions
  def self.load(year, day)
    file_path = instructions_file_path(year, day)
    download(year, day)
    file_path
  end

  def self.create_required_directories(year)
    year_directory = File.join("instructions", year)
    FileUtils.mkdir_p(year_directory) if !Dir.exist?(year_directory)
  end

  def self.instructions_file_path(year, day)
    padded_day = day.rjust(2, "0")
    year_last_two = year.to_s[-2..]
    File.join("instructions", year, "#{padded_day}#{year_last_two}.md")
  end

  def self.download(year, day)
    aoc_api = AocApi.new(ENV["AOC_COOKIE"])
    whole_page = aoc_api.instructions(year, day)
    instructions = whole_page.match(/(?<=<main>).+(?=<\/main>)/m).to_s
    markdown_instructions = ReverseMarkdown.convert(instructions).strip
    save_instructions_file(year, day, markdown_instructions)
  end

  def self.save_instructions_file(year, day, input)
    create_required_directories(year)
    File.open(instructions_file_path(year, day), "w") { |f| f.write input }
  end
end
