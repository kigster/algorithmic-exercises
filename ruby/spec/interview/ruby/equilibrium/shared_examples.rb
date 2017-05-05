require 'spec_helper'

RSpec.shared_examples :equilibrium do |klass, benchmark|
  let(:benchmark) { benchmark }
  subject(:finder) {klass.new(array)}

  let(:array) {[-1, 3, -4, 5, 1, -6, 2, 1]}
  its(:ary) {should eq(array)}

  context 'three equilibrium indices' do
    its(:run) {should eq([1, 3, 7])}
  end

  context 'boundary conditions' do
    let(:array) {[1, -2, 1, 1]}
    its(:run) {should eq([0, 3])}
  end

  context 'blank array' do
    let(:array) {[]}
    its(:run) {should eq([0])}
  end

  context 'performance' do
    let(:array) {(-401..400).to_a}
    it 'should perform' do
      expect {finder.run}.to perform_at_least(benchmark, time: 0.4, warmup: 0.2) {}
    end
    its(:run) {should eq([0])}
  end
end

