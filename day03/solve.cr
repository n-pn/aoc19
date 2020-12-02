INPUT = {{ __DIR__ }} + "/input.txt"

def read_input(file = INPUT)
  File.read_lines(file).map do |line|
    line.split(",").map do |item|
      dir = item[0]
      len = item[1..].to_i
      {dir, len}
    end
  end
end

alias Map = Hash(Int32, Int32)

def solve_1
  mapped = Hash(Int32, Map).new { |h, k| h[k] = Map.new }

  line1, line2 = read_input
  x = y = 0

  line1.each do |dir, len|
    len.times do
      case dir
      when 'R' then x += 1
      when 'L' then x -= 1
      when 'U' then y += 1
      when 'D' then y -= 1
      end

      mapped[x][y] = 1
    end
  end

  x = y = 0
  output = [] of Tuple(Int32, Int32)

  line2.each do |dir, len|
    len.times do
      case dir
      when 'R' then x += 1
      when 'L' then x -= 1
      when 'U' then y += 1
      when 'D' then y -= 1
      end

      output << ({x, y}) if mapped[x][y]? == 1
    end
  end

  puts output.min_by { |a, b| a.abs + b.abs }.map(&.abs).sum
end

def solve_2
  line1, line2 = read_input

  map1 = Hash(Int32, Map).new { |h, k| h[k] = Map.new }
  x1 = y1 = step1 = 0

  line1.each do |dir, len|
    len.times do
      case dir
      when 'R' then x1 += 1
      when 'L' then x1 -= 1
      when 'U' then y1 += 1
      when 'D' then y1 -= 1
      end

      step1 += 1
      map1[x1][y1] ||= step1
    end
  end

  map2 = Hash(Int32, Map).new { |h, k| h[k] = Map.new }
  x2 = y2 = step2 = 0

  output = [] of Tuple(Int32, Int32, Int32)

  line2.each do |dir, len|
    len.times do
      case dir
      when 'R' then x2 += 1
      when 'L' then x2 -= 1
      when 'U' then y2 += 1
      when 'D' then y2 -= 1
      end

      step2 += 1
      map2[x2][y2] ||= step2

      next unless step1 = map1[x2][y2]?
      output << ({x2, y2, step1 + step2})
    end
  end

  puts output.min_by { |x, y, s| s }
end

solve_1
solve_2
