module Interview
  module Ruby
    module BinaryGap

      class LoopState
        attr_accessor :current, :previous, :seen_one
        attr_accessor :current_sum, :max_sum

        def initialize(number)
          self.current = number
          self.seen_one = false
          self.current_sum = 0
          self.max_sum = 0
        end

        def next
          self.previous = current
          shift!
          self.current_sum = if (remainder(previous, current) == 0 && seen_one)
                               self.current_sum + 1
                             else
                               self.seen_one = true
                               self.max_sum  = current_sum if current_sum > max_sum
                               0
                             end
        end

        private

        def shift!
          self.current >>= 1
        end

        def remainder(value, shifted = (value >> 1))
          value - shifted * 2
        end
      end
    end
  end
end
