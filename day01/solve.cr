INPUT = {{ __DIR__ }} + "/input.txt"

def read_input(file)
  File.read_lines(file).map(&.to_i)
end

def calc_fuel_1(mass : Int32)
  return 0 if mass < 0
  mass // 3 - 2
end

def part1(file = INPUT)
  read_input(file).map { |i| calc_fuel_1(i) }.sum
end

def calc_fuel_2(mass : Int32)
  return 0 unless mass > 0

  fuel = mass // 3 - 2
  fuel = 0 if fuel < 0

  fuel + calc_fuel_2(fuel)
end

def part2(file = INPUT)
  read_input(file).map { |i| calc_fuel_2(i) }.sum
end

puts part1
puts part2
