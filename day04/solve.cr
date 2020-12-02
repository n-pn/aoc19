def never_decrease?(digits : Array(Int32))
  0.upto(digits.size - 2) { |i| return false if digits[i] < digits[i + 1] }
  true
end

def valid_pass1?(num : Int32)
  digits = num.digits
  return false unless never_decrease?(digits)

  0.upto(digits.size - 2) { |i| return true if digits[i] == digits[i + 1] }
  false
end

def day_1(min = 123257, max = 647015)
  count = 0
  min.upto(max) { |num| count += 1 if valid_pass1?(num) }
  puts count
end

def valid_pass2?(num : Int32)
  digits = num.digits
  return false unless never_decrease?(digits)

  0.upto(digits.size - 2) do |i|
    next unless digits[i] == digits[i + 1]
    return true unless digits[i] == digits[i + 2]? || digits[i] == digits[i - 1]
  end

  false
end

def day_2(min = 123257, max = 647015)
  count = 0
  min.upto(max) { |num| count += 1 if valid_pass2?(num) }
  puts count
end

day_1
day_2

# puts valid_pass2?(112233)
# puts valid_pass2?(123444)
# puts valid_pass2?(111122)
