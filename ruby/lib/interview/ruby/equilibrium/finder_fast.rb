require_relative 'finder'
module Interview
  module Ruby
    module Equilibrium
      class FinderFast < Finder
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
  end
end

def solution(array)
  eqs   = Codility::EquilibriumFinder.new(array).run
  index = (rand * eqs.size).to_i
  eqs[index]
end

