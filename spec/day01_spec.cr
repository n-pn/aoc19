require "spec"
require "../src/day01"

describe Day01 do
  it "returns right fuel1 value", tags: "part1" do
    Day01.fuel1(12).should eq(2)
    Day01.fuel1(14).should eq(2)
    Day01.fuel1(1969).should eq(654)
    Day01.fuel1(100756).should eq(33583)
  end

  it "returns right fuel2 value", tags: "part2" do
    Day01.fuel2(12).should eq(2)
    Day01.fuel2(1969).should eq(966)
    Day01.fuel2(100756).should eq(50346)
  end
end
