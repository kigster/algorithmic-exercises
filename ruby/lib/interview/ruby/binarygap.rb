# BinaryGap
# ==========
#
# Find longest sequence of zeros in binary representation of an integer.
#
# A binary gap within a positive integer N is any maximal sequence of consecutive zeros that is surrounded by
# ones at both ends in the binary representation of N.
#
# For example, number 9 has binary representation 1001 and contains a binary gap of length 2. The number 529
# has binary representation 1000010001 and contains two binary gaps: one of length 4 and one of length 3. The number 20 has binary representation 10100 and contains one binary gap of length 1. The number 15 has binary representation 1111 and has no binary gaps.
#
# Write a function:
#
# def solution(n)
#   ....
# end
#
# that, given a positive integer N, returns the length of its longest binary gap. The function should return
# 0 if N doesn't contain a binary gap.
#
# For example, given N = 1041 the function should return 5, because N has binary representation 10000010001
# and so its longest binary gap is of length 5.
#
# Assume that:
#
# N is an integer within the range [1..2,147,483,647].
# Complexity:
#
# expected worst-case time complexity is O(log(N));
# expected worst-case space complexity is O(1).

module Interview
  module Ruby
    module BinaryGap
      # Enumerator class that offers #each that shifts
      # the number to the right, and returns the shifted bit.
      class BitShifter
        include Enumerable
        attr_accessor :number

        def initialize(number)
          self.number = number
        end

        def each(&block)
          return enum_for(:each) unless block
          x = number
          begin
            bit = (x & 0b1)
            x   >>= 1
            yield bit
          end while x != 0
        end
      end

      class Gap
        attr_accessor :found_one, :sum, :max

        def initialize
          self.found_one = false
          self.sum       = 0
          self.max       = 0
        end
      end


      def self.gap(number)
        shifter = BitShifter.new(number)
        gap     = Gap.new

        shifter.each do |bit|
          if bit == 0
            gap.sum += 1 if gap.found_one
          elsif bit == 1
            gap.found_one = true
            gap.max       = gap.sum if gap.sum > gap.max
            gap.sum       = 0
          else
            raise ArgumentError, 'Expecting a binary value, got ' + bit.to_s
          end
        end
        gap.max
      end
    end
  end
end

def solution(n)
  Interview::Ruby::BinaryGap.gap(n)
end
