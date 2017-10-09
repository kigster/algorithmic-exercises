require 'spec_helper'

def test_name(value, expected)
  "n = #{value} = [#{sprintf "%s", value.to_s(2)}] -> #{sprintf "%s", expected}"
end

# An adapter class to fit the code to measure in complexity assert
class GapSearchBigO
  srand(71)

  def number_with_bit_length(bit_size)
    (1..(bit_size - 1)).to_a.inject(2**(bit_size - 1)) { |sum, bit_index| sum |= (rand(2) * (2**bit_index)); sum }
  end

  alias_method :generate_args, :number_with_bit_length

  # Run the code on which we want to assert performance
  def run(number)
    Interview::Ruby::BinaryGap.gap(number)
  end
end

RSpec.describe Interview::Ruby::BinaryGap do

  shared_examples :binary_gap do |number_n, expected_gap|
    # uncomment to see loggings
    subject(:gap) {described_class.gap(number_n)}
    it ('should return correct gap') { expect(gap).to eq(expected_gap)}
  end

  context(test_name(        529, 4)) {include_examples :binary_gap, 529, 4}
  context(test_name(         15, 0)) {include_examples :binary_gap, 15, 0}
  context(test_name(       1041, 5)) {include_examples :binary_gap, 1041, 5}
  context(test_name(          6, 0)) {include_examples :binary_gap, 6, 0}
  context(test_name(         19, 2)) {include_examples :binary_gap, 19, 2}
  context(test_name( 1376796946, 3)) {include_examples :binary_gap, 1376796946,  5}
  context(test_name(     561892, 3)) {include_examples :binary_gap, 561892, 3}
  context(test_name(      51712, 2)) {include_examples :binary_gap, 51712, 2}
  context(test_name(         20, 1)) {include_examples :binary_gap, 20, 1}
  context(test_name(       1024, 0)) {include_examples :binary_gap, 1024, 0}

  # this algorithm is linear with respect to N
  context 'log(n) complexity' do
    xit ('should be linear') { expect(GapSearchBigO.new).to be_linear }
  end
end

RSpec.describe Interview::Ruby::BinaryGap::BitShifter do
  shared_examples :bit_shifter do |number, expectation|
    subject(:shifter) { described_class.new(number) }
    it('should equal to map') { expect(shifter.to_a).to eq(expectation) }
    it('bit length should be correct') { expect(number.bit_length).to eq(expectation.size) }
  end

  context(test_name(4,  [1, 0, 0 ]))    { include_examples :bit_shifter, 4, [0, 0, 1] }
  context(test_name(63, [1,1,1,1,1,1])) { include_examples :bit_shifter, 63, [1,1,1,1,1,1] }
end
