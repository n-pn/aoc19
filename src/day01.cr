module Day01
  extend self

  def fuel1(mass : Int32)
    return 0 if mass < 0
    mass // 3 - 2
  end

  def part1(file = "inp/day01.txt")
    data = File.read_lines(file).map(&.to_i)
    data.map { |i| fuel1(i) }.sum
  end

  def fuel2(mass : Int32)
    return 0 unless mass > 0

    fuel = mass // 3 - 2
    fuel = 0 if fuel < 0

    fuel + fuel2(fuel)
  end

  def part2(file = "inp/day01.txt")
    data = File.read_lines(file).map(&.to_i)
    data.map { |i| fuel2(i) }.sum
  end
end

# puts Day01.part1
# puts Day01.part2
