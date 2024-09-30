RSpec.describe Year2023::Day01 do
  let(:input_1) {
    StringIO.new(
      <<~IN
        1abc2
        pqr3stu8vwx
        a1b2c3d4e5f
        treb7uchet
      IN
    )
  }

  let(:input_2) {
    StringIO.new(
      <<~IN +
        two1nine
        eightwothree
        abcone2threexyz
        xtwone3four
        4nineeightseven2
        zoneight234
        7pqrstsixteen
      IN
      <<~IN
        rlsucirultesirnsoamnstsrm124oneight
        rlsucirultesirnsoamnstsrmoneight124
      IN
    )
  }

  it "solves Part One" do
    expect(subject.part_1(input_1)).to eq(142)
  end

  it "solves Part Two" do
    expect(subject.part_2(input_2)).to eq(281 + 18 + 14)
  end
end
