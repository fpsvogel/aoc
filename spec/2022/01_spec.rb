RSpec.describe Year2022::Day01 do
  let(:input) {
    StringIO.new(
      <<~IN
        1000
        2000
        3000

        4000

        5000
        6000

        7000
        8000
        9000

        10000
      IN
    )
  }

  it "solves Part One" do
    expect(subject.part_1(input)).to eq(24000)
  end

  it "solves Part Two" do
    expect(subject.part_2(input)).to eq(45000)
  end
end
