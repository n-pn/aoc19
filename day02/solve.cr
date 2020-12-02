module Day02
  extend self

  def calc1(list = [] of Int, idx = 0)
    loop do
      case opcode = list[idx]?
      when 99
        return list.first
      when 1, 2
        inp_a = list[list[idx + 1]]
        inp_b = list[list[idx + 2]]

        out_p = list[idx + 3]
        list[out_p] = opcode == 1 ? inp_a + inp_b : inp_a * inp_b

        idx += 4
      else
        raise "Unknown opcode #{opcode}"
      end
    end
  end

  def part1
    data = load_input

    data[1] = 12
    data[2] = 2

    calc1(data)
  end

  def part2
    0.upto(99) do |noun|
      0.upto(99) do |verb|
        data = load_input
        data[1] = noun
        data[2] = verb

        if calc1(data) == 19690720
          return 100 * noun + verb
        end
      end
    end
  end

  private def load_input(file = "day02/input.txt")
    File.read(file).split(",").map(&.to_i)
  end
end

puts Day02.part1
puts Day02.part2
