class AocApi
  include HTTParty
  base_uri "https://adventofcode.com"

  private attr_reader :headers

  def initialize(session)
    @headers = {
      "Cookie" => "session=#{session}",
      "User-Agent" => "github.com/fpsvogel/ruby-advent-of-code",
    }
  end

  def input(year, day)
    self.class.get("/#{year}/day/#{day}/input", headers:)
  end

  def instructions(year, day)
    self.class.get("/#{year}/day/#{day}", headers:)
  end

  def submit(year, day, part, answer)
    response = self.class.post(
      "/#{year}/day/#{day}/answer",
      body: "level=#{part}&answer=#{answer}",
      headers:,
    )
  end
end
