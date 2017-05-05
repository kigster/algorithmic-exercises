require_relative 'finder'
module Interview
  module Ruby
    module Equilibrium
      class FinderSlow < Finder
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
    end
  end
end
