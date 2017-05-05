module Interview
  module Ruby
    module Equilibrium
      class ArrayWithSum < Array
        def sum
          self.reduce(&:+)
        end
      end

      # Must return a random index from the list of equilibriums
      def solution(array, implementation)
        eqs   = implementation.new(array).run
        index = (rand * eqs.size).to_i
        eqs[index]
      end
    end
  end
end

require 'interview/ruby/equilibrium/finder_slow'
require 'interview/ruby/equilibrium/finder_fast'


include Interview::Ruby::Equilibrium

