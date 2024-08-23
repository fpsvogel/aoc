class InputFile
  def self.download(year, day, notify_exists: false)
    padded_day = day.rjust(2, "0")
    file_path = File.join("input", year, "#{padded_day}.txt")

    if File.exist?(file_path)
      puts "#{file_path} already exists, skipping" if notify_exists
    else
      year_directory = File.join("input", year)
      FileUtils.mkdir_p(year_directory) if !Dir.exist?(year_directory)

      aoc_api = AocApi.new(ENV["AOC_COOKIE"])
      response = aoc_api.input(year, day)
      File.write(file_path, response)
    end

    file_path
  end
end
