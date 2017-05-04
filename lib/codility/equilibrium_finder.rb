module Codility

  class ArrayWithSum < Array
    def sum
      self.reduce(&:+)
    end
  end

  # [-1, 3, -4, 5, 1, -6, 2, 1]
  class EquilibriumFinder
    attr_accessor :ary

    def initialize(array)
      self.ary = ArrayWithSum.new(array)
    end

    def run
      return [0] if ary.empty?
      output = []
      l      = self.ary.size
      output << 0 if self.ary[1..-1].sum == 0
      self.ary[1..-2].each_with_index do |n, i|
        if self.ary[0..(i - 1)].sum == self.ary[(i + 1)..-1].sum
          output << i
        end
      end
      output << (l - 1) if self.ary[0..(l - 2)].sum == 0
      output
    end
  end

  class FasterFinder < EquilibriumFinder
    def run
      return [0] if ary.empty?

      output = []

      sum      = ary.sum.freeze
      len      = ary.size
      last     = len - 1
      left_sum = 0

      self.ary.each_with_index do |n, i|
        left_sum  += ary[i - 1] if i > 0
        right_sum = sum - n - left_sum if i < last

        if left_sum == right_sum || i == 0 && right_sum == 0 || i == last && left_sum == 0
          output << i
        end
      end
      output
    end
  end
end

def solution(array)
  eqs   = Codility::EquilibriumFinder.new(array).run
  index = (rand * eqs.size).to_i
  eqs[index]
end

