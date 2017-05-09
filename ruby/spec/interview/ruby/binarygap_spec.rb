require 'spec_helper'

def test_name(value, expected)
  "n = #{value} = [#{sprintf "%s", value.to_s(2)}] -> #{sprintf "%s", expected}"
end

RSpec.describe Interview::Ruby::BinaryGap do
  shared_examples :binary_gap do |number_n, expected_gap|
    # uncomment to see logging
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
