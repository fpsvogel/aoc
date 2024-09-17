RSpec.describe Year2021::Day02 do
  let(:input) {
    StringIO.new(
      <<~IN
        forward 5
        down 5
        forward 8
        up 3
        down 8
        forward 2
      IN
    )
  }

  it "solves Part One" do
    expect(subject.part_1(input)).to eq(150)
  end

  it "solves Part Two" do
    expect(subject.part_2(input)).to eq(900)
  end
end
