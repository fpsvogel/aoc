class InstructionsFile
  def self.download(year, day, overwrite: false)
    padded_day = day.rjust(2, "0")
    year_last_two = year[-2..]
    file_path = File.join("instructions", year, "#{year_last_two}#{padded_day}.md")

    if File.exist?(file_path) && !overwrite
      puts "#{file_path} already exists, skipping"
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
