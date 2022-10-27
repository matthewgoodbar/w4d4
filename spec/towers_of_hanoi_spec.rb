require 'rspec'
require 'towers_of_hanoi'

describe TowersOfHanoi do
    subject(:tower) { TowersOfHanoi.new }
    describe '#initialize' do
        it 'should initialize a set of three pegs with three disks on the first peg' do
            expect(tower.pegs).to eq([[3,2,1],[],[]])
        end
    end

    describe '#move' do
        it 'should take a starting peg, and an ending peg' do
            expect { tower.move(0,2) }.to_not raise_error(ArgumentError)
        end
        it 'should raise an exception when any of the given pegs are out of bounds' do
            expect { tower.move(4, 6) }.to raise_error(ArgumentError)
        end
        context 'when a move is invalid' do
            it 'should not change the state of the pegs' do
                tower.move(0,2)
                tower.move(0,2)
                expect(tower.pegs).to eq([[3,2],[],[1]])
            end
        end
        context 'when a move is valid' do
            it 'should move the disk' do
                tower.move(0,2)
                expect(tower.pegs).to eq([[3,2],[],[1]])
            end
        end
    end

    describe '#win?' do
        it 'should return true when every disk is on the final peg' do
            tower.move(0,2)
            tower.move(0,1)
            tower.move(2,1)
            tower.move(0,2)
            tower.move(1,0)
            tower.move(1,2)
            tower.move(0,2) #tower.pegs[2] => [3,2,1]
            expect(tower.win?).to be(true)
        end
        it 'should return false when not every disk is on the final peg' do
            expect(tower.win?).to be(false)
        end
    end
end