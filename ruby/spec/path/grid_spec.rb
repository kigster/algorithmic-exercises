require 'path/grid'

RSpec.describe Path::Grid do
  let(:width) { 5 }
  let(:height) { 5 }

  context 'Getters and Setters' do
    before { expect_any_instance_of(Path::Grid).to receive(:populate!) }

    subject(:grid) { described_class.new(width, height) }

    describe '#[]' do
      it('should initialize with zeros') { expect(grid[1, 1]).to eq(0) }

      it 'should return 0 when X is out of range' do
        expect(grid[width + 1, 0]).to eq(0)
        expect(grid[0, 0]).to eq(0)
      end

      it 'should return 0 when Y is out of range' do
        expect(grid[0, height + 1]).to eq(0)
        expect(grid[0, -1]).to eq(0)
      end
    end

    describe '#[]=' do
      let(:random) { rand * 100.0 }
      before { grid[1, 1] = random }
      it 'should initialize with the value provided' do
        expect(grid[1, 1]).to eq(random)
      end
    end
  end

  describe 'Path Finder' do
    let(:blocked_cells) { [] }
    subject(:grid) { described_class.new(width, height, blocked_cells) }

    context 'without blocked cells' do
      it 'should compute a total number of available paths' do
        expect(grid[4, 4]).to eq(70)
        expect(grid[3, 3]).to eq(20)
        expect(grid[2, 2]).to eq(6)
        expect(grid[1, 1]).to eq(2)
      end

      it 'should return the last value as #num_paths' do
        expect(grid.num_paths).to eq(grid[width - 1, height - 1])
        expect(grid.num_paths).to eq(70)
      end
    end

    context 'with some cells blocked' do
      let(:blocked_cells) { [
        [1, 4],
        [2, 3]
      ] }

      it 'should return the last value as #num_paths' do
        expect(grid.num_paths).to eq(grid[width - 1, height - 1])
        expect(grid.num_paths).to eq(35)
      end
    end

    context 'when the final corner is unreachable ' do
      let(:blocked_cells) { [
        [0, 4],
        [1, 4],
        [2, 4],
        [3, 4],
        [4, 4]
      ] }

      it 'should have a total number of paths set to zero' do
        expect(grid.num_paths).to eq(0)
      end
    end

    describe '#inspect' do
      it 'should match numbers in the last row' do
        expect(grid.inspect).to match '1    5   15   35   70'
      end
    end
  end
end
