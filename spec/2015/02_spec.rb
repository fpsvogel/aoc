RSpec.describe Year2015::Day02 do
  let(:input) {
    StringIO.new(
      <<~IN
        2x3x4
        1x1x10
      IN
    )
  }

  it "solves Part One" do
    expect(subject.part_1(input)).to eq(101)
  end

  it "solves Part Two" do
    expect(subject.part_2(input)).to eq(48)
  end
end
