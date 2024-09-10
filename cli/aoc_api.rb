class AocApi
  include HTTParty
  base_uri "https://adventofcode.com"

  private attr_reader :headers

  def initialize(session)
    @headers = {
      "Cookie" => "session=#{session}",
      "User-Agent" => "github.com/fpsvogel/ruby-advent-of-code by fps.vogel@gmail.com",
    }
  end

  def input(year, day)
    self.class.get("/#{year}/day/#{day}/input", headers:)
  end

  def instructions(year, day)
    self.class.get("/#{year}/day/#{day}", headers:)
  end

  def submit(year, day, part, answer)
    self.class.post(
      "/#{year}/day/#{day}/answer",
      body: { level: part, answer: },
      headers:,
    )
  end
end
