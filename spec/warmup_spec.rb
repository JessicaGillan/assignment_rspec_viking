require 'warmup'

describe Warmup do
	before { allow($stdout).to receive(:puts) }

  let(:warmup) { Warmup.new }
  let(:arr_dbl) { double(size: 9) }

	describe '#gets_shout' do
		it "will take a string and return it in all caps" do
			allow(warmup).to receive(:gets).and_return("hello")
			expect(warmup.gets_shout).to eq("HELLO")
		end
	end

	describe '#triple_size' do
		it "returns an int that is triple the size of item passed in" do
			expect(warmup.triple_size(arr_dbl)).to eq(27)
		end
	end
end