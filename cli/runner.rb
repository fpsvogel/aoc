class Runner
  def self.load_solution(year, day)
    padded_day = day.rjust(2, "0")
    Module.const_get("Year#{year}").const_get("Day#{padded_day}").new
  rescue NameError
    puts "There is no solution for this puzzle"
  end

  def self.run_part(part_name)
    has_result = false
    t = Benchmark.realtime do
      answer = yield
      if !answer.nil?
        puts "Result for #{part_name}:"
        puts answer
        Clipboard.copy(answer)
        has_result = true
      else
        puts "no result for #{part_name}"
      end
    end

    if has_result
      puts "(obtained in #{t} seconds)"
    end
  end
end
