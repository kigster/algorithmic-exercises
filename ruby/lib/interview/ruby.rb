require 'interview/ruby/version'

module Interview
  module Ruby
    class ArrayWithSum < Array
      def sum
        self.reduce(&:+)
      end
    end
  end
end

require 'interview/ruby/equilibrium'
require 'interview/ruby/binarygap'
require 'interview/ruby/equilibrium/finder_slow'
require 'interview/ruby/equilibrium/finder_fast'


