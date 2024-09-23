class InstructionsFile
  def self.path(year, day)
    padded_day = day.rjust(2, "0")
    year_last_two = year[-2..]
    File.join("instructions", year, "#{year_last_two}#{padded_day}.md")
  end

  def self.download(year, day, overwrite: false)
    file_path = path(year, day)

    if File.exist?(file_path) && !overwrite
      puts "Already exists: #{file_path}"
    else
      year_directory = File.join("instructions", year)
      FileUtils.mkdir_p(year_directory) if !Dir.exist?(year_directory)

      aoc_api = AocApi.new(ENV["AOC_COOKIE"])
      response = aoc_api.instructions(year, day)
      instructions = response.match(/(?<=<main>).+(?=<\/main>)/m).to_s
      markdown_instructions = ReverseMarkdown.convert(instructions).strip
      File.write(file_path, markdown_instructions)
    end

    file_path
  end
end
