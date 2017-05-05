module Interview
  module Ruby
    module Equilibrium
      class Finder
        attr_accessor :ary
        def initialize(array)
          self.ary = ArrayWithSum.new(array)
        end

        def run
          raise ArgumentError, 'Abstract method #run is called on superclass'
        end
      end
    end
  end
end
