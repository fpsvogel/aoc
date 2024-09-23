RSpec.describe Year2021::Day03 do
  let(:input) {
    StringIO.new(
      <<~IN
        00100
        11110
        10110
        10111
        10101
        01111
        00111
        11100
        10000
        11001
        00010
        01010
      IN
    )
  }

  it "solves Part One" do
    expect(subject.part_1(input)).to eq(198)
  end

  it "solves Part Two" do
    expect(subject.part_2(input)).to eq(230)
  end
end
