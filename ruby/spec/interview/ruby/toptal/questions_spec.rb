# Write a function that sorts the keys in a hash by the length of the key as
# a string. For instance, the hash:
#
#       { abc: 'hello', 'another_key' => 123, 4567 => 'third' }
#
# should result in:
#
#       ["abc", "4567", "another_key"]
#
# https://www.toptal.com/ruby/interview-questions

class KeyHashSorter < Struct.new(:hash)
  def run
    hash.keys.map(&:to_s).sort { |a, b| a.size <=> b.size }
  end
end

RSpec.describe KeyHashSorter do
  let(:hash) { { abc: 'hello', 'another_key' => 123, 4567 => 'third' } }
  let(:sorter) { KeyHashSorter.new(hash) }

  it 'should sort the hash' do
    expect(sorter.run).to eq(["abc", "4567", "another_key"])
  end
end

# Write a single line of Ruby code that prints the Fibonacci sequence of any length as an array.
#
# (Hint: use inject/reduce)

def fibo(n)
  (1..n).inject([]) { |memo, i| [1, 2].include?(i) ? memo << i : memo << (memo.last + i) }
end

RSpec.describe :Fibonacci do
  let(:n) { 10 }
  subject { fibo(n) }
  it { is_expected.to eq [1, 2, 5, 9, 14, 20, 27, 35, 44, 54] }
end


# The rgb() method is incomplete. Complete the method so that passing in RGB
# decimal values will result in a hexadecimal representation being returned
# valid decimal values for RGB are 0 - 255. Any (r,g,b) argument values that
# fall out of that range should be rounded to the closest valid value.
#
# The following are examples of expected output values:
#
# rgb(255, 255, 255) # returns FFFFFF
# rgb(255, 255, 300) # returns FFFFFF
# rgb(0,0,0) # returns 000000
# rgb(148, 0, 211) # returns 9400D3

class RGB
  class << self
    def run(*rgb)
      hex(*in_range(*rgb)).join
    end

    private

    def in_range(*args)
      args.map { |r| [[0, r].max, 255].min }
    end

    def hex(*args)
      args.map { |r| sprintf "%02X", r }
    end
  end
end

RSpec.describe RGB do
  subject { RGB.run(*rgb) }

  shared_examples_for :rgb do |hex|
    context "#{hex}" do
      it { is_expected.to eq hex }
    end
  end

  describe RGB do
    subject { RGB.run(*values) }

    context 'FFFFFF' do
      let(:values) { [255, 255, 255] }
      it_behaves_like :rgb, 'FFFFFF'
    end

    context 'F08000' do
      let(:values) { [240, 128, 0] }
      it_behaves_like :rgb, 'F08000'
    end

    context '00FF10' do
      let(:values) { [-120, 39898, 16] }
      it_behaves_like :rgb, '00FF10'
    end
  end
end
