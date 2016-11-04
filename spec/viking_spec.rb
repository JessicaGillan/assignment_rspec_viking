require 'viking'
require 'weapons/weapon'

describe Viking do
  before { allow($stdout).to receive(:puts) }
  let(:viking){ Viking.new("Oleg", 70) }
  let(:cupcake_weapon){ Weapon.new("Cupcake") }
  let(:stapler_weapon){ Weapon.new("Stapler") }

	describe '#initialize' do

		it 'sets a passed name to the name attribute' do
			expect(viking.name).to eq("Oleg")
		end

		it 'sets a passed health to the health attribute' do
			expect(viking.health).to eq(70)
		end

		it 'does not allow health to be overwritten after initialize' do
			expect{ viking.health = 90 }.to raise_error(NoMethodError)
		end

    describe '#weapon' do

      it 'starts out nil by default' do
        expect(viking.weapon).to be_nil
      end

    end
	end

  describe '#pick_up_weapon' do

    it 'sets weapon when picked up' do
      viking.pick_up_weapon(cupcake_weapon)
      expect(viking.weapon).to eq(cupcake_weapon)
    end

    it 'complains when you try to pick up a non weapon' do
      expect do
        viking.pick_up_weapon("string")
      end.to raise_error("Can't pick up that thing")
    end

    it 'replaces the existing weapon when picking up a new one' do
      viking.pick_up_weapon(cupcake_weapon)
      viking.pick_up_weapon(stapler_weapon)
      expect(viking.weapon).to eq(stapler_weapon)
    end

  end
end
