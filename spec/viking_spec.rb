require 'viking'

describe Viking do
  before { allow($stdout).to receive(:puts) }

	describe '#initialize' do
		let(:viking){ Viking.new("Oleg", 70) }

		it 'sets a passed name to the name attribute' do
			expect(viking.name).to eq("Oleg")
		end

		it 'sets a passed health to the health attribute' do
			expect(viking.health).to eq(70)
		end

		it 'does not allow health to be overwritten after initialize' do
			expect{ viking.health = 90 }.to raise_error(NoMethodError)
		end
	end
end