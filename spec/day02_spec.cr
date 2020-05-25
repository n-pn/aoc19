require "spec"
require "../src/day02"

describe Day02 do
  it "returns right value", tags: "part1" do
    inp = [1, 9, 10, 3, 2, 3, 11, 0, 99, 30, 40, 50]
    Day02.calc1(inp).should eq(3500)
  end
end
