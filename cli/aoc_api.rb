# HTTP API for downloading puzzles
class AocApi
  include HTTParty
  base_uri 'https://adventofcode.com'

  def initialize(year, session)
    @year = year
    @options = {
      headers:
        {
          'Cookie' => "session=#{session}",
          'User-Agent' => 'github.com/Keirua/aoc-cli by clement@keiruaprod.fr'
        }
    }
  end

  def day(day_number)
    self.class.get("/#{@year}/day/#{day_number}/input", @options)
  end
end
