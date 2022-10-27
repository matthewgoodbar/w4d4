require 'rspec'
require 'problems'

describe 'my_uniq' do
    let(:arr) { [1,2,1,3,3] }
    it 'should remove duplicates from the array' do
        expect(my_uniq(arr)).to include(1,2,3)
    end

    it 'should return a new array' do
        expect(my_uniq(arr)).to_not be(arr)
    end

    it 'should return elements in the order they appear' do
        expect(my_uniq(arr)).to eq([1,2,3])
    end
end

describe Array do
    describe '#two_sum' do
        it 'finds pairs of indices whose elements add to zero' do
            arr = [99, -2, 2] #expect [[1,2]]
            expect(arr.two_sum[0]).to include(1,2)
        end

        it 'orders indices correctly within each pair' do
            arr = [-1,0,2,-2,1]
            expect(arr.two_sum).to include([0,4], [2,3])
        end

        it 'orders each pair dictionary-wise' do
            arr = [-1,0,2,-2,1]
            expect(arr.two_sum).to eq([[0,4], [2,3]])
        end
    end
end

describe 'my_transpose' do
    let(:matrix) {[[1,2,3],[4,5,6],[7,8,9]]}
    let(:transposed) {[[1,4,7],[2,5,8],[3,6,9]]}
    it 'should correctly transpose the matrix' do
        expect(my_transpose(matrix)).to eq(transposed)
    end
end

describe 'stock_picker' do
    let(:stocks) {[5,4,3,5,6,7]}
    it 'should not sell a stock before buying it' do
        expect(stock_picker(stocks)).to eq([2,5])
    end
    it 'should return the most profitable margin' do
        expect(stock_picker(stocks)).to include(2,5)
    end
    it 'should return nil if there is no profitable margin' do
        downward = [9,7,4,4,3,2,1]
        expect(stock_picker(downward)).to be(nil)
    end
end

