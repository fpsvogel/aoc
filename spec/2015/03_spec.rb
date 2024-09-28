RSpec.describe Year2015::Day03 do
  let(:input) {
    StringIO.new(
      <<~IN
        >^>v<^
      IN
    )
  }

  it "solves Part One" do
    expect(subject.part_1(input)).to eq(5)
  end

  it "solves Part Two" do
    expect(subject.part_2(input)).to eq(4)
  end
end
