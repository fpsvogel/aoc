class InputFile
  LOGGED_OUT_RESPONSE = "Puzzle inputs differ by user.  Please log in to get your puzzle input.\n"

  def self.download(year, day, notify_exists: true)
    padded_day = day.rjust(2, "0")
    file_path = File.join("input", year, "#{padded_day}.txt")

    if File.exist?(file_path)
      puts "Already exists: #{file_path}" if notify_exists
    else
      year_directory = File.join("input", year)
      FileUtils.mkdir_p(year_directory) if !Dir.exist?(year_directory)

      aoc_api = AocApi.new(ENV["AOC_COOKIE"])
      response = aoc_api.input(year, day)

      if response.to_s == LOGGED_OUT_RESPONSE
        raise AuthError, "You're logged out! Go to https://adventofcode.com then " \
          "log in, copy your session cookie, and paste into `AOC_COOKIE` in .env"
      end

      File.write(file_path, response)
    end

    file_path
  end
end
