require 'weapons/bow'

describe Bow do
	let(:bow){ Bow.new }

	describe '#arrows' do
		it 'returns arrow count' do
			expect(Bow.new(20).arrows).to eq(20)
		end

		it 'has a default start of ten arrows' do
			expect(bow.arrows).to eq(10)
		end

		it 'can be set with a specified amount of arrows' do
			expect(Bow.new(20).arrows).to eq(20)
		end
	end

	describe '#use' do
		it "reduces number of arrows by one" do
			bow.use
			expect(bow.arrows).to eq(9)
		end

		it 'throws an error if it has 0 arrows' do
			bow = Bow.new(0)
			expect{ bow.use }.to raise_error("Out of arrows")
		end
	end
end
