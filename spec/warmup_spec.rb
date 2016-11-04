require 'warmup'

describe Warmup do
	before { allow($stdout).to receive(:puts) }

  let(:warmup) { Warmup.new }
  let(:arr_dbl) { double(size: 9) }
  let(:str_dbl) { double(upcase!: "HELLO",
                         empty?: false,
                         reverse!: "OLLEH") }

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

  describe '#calls_some_methods' do
    it 'calls upcase method' do
      expect(str_dbl).to receive(:upcase!)
      warmup.calls_some_methods(str_dbl)
    end

    it 'calls reverse method' do
      str = "hello"
      expect(str).to receive(:reverse!)
      warmup.calls_some_methods(str)
    end

    it 'returns a different object than passed in' do
      str = "hello"
      expect(warmup.calls_some_methods(str).object_id).not_to eq(str.object_id)
    end

  end

end
