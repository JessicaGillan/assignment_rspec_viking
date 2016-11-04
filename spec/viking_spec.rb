require 'viking'
require 'weapons/weapon'

describe Viking do
  before { allow($stdout).to receive(:puts) }
  let(:viking){ Viking.new("Oleg", 70) }
  let(:other_viking){ Viking.new("Hilda", 80) }
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

  describe '#drop_weapon' do
  	it 'leaves the viking weaponless' do
  		viking.pick_up_weapon(cupcake_weapon)
  		viking.drop_weapon
  		expect(viking.weapon).to be_nil
  	end
  end

  describe '#receive_attack' do
  	it 'reduces the viking\'s health by the specified amount' do
  		viking.receive_attack(69)
  		expect(viking.health).to eq(1)
  	end

  	it 'calls the take_damage method' do
  		expect(viking).to receive(:take_damage)
  		viking.receive_attack(69)
  	end
  end

  describe '#attack' do
  	it 'damages the health of the viking attacked' do
  		viking.attack(other_viking)
  		expect(other_viking.health).to be < 80
  	end

  	it 'calls the attacked viking\'s take_damage method' do
  		expect(other_viking).to receive(:take_damage)
  		viking.attack(other_viking)
  	end

  	it 'runs damage_with_fists if viking has no weapon' do
  		expect(viking).to receive(:damage_with_fists).and_return(2.5)

  		viking.attack(other_viking)
  	end

  	it 'deals fist multiplier times strength damage when no weapon' do
  		expect(other_viking).to receive(:receive_attack).with(2.5)

  		viking.attack(other_viking)
  	end

  	it 'runs damage_with_weapon if viking has weapon' do
  		expect(viking).to receive(:damage_with_weapon).and_return(2.5)

  		viking.pick_up_weapon(cupcake_weapon)
  		viking.attack(other_viking)
  	end

  	it 'deals weapon multiplier times strength damage when have weapon' do
  		expect(other_viking).to receive(:receive_attack).with(10)

  		viking.pick_up_weapon(cupcake_weapon)
  		viking.attack(other_viking)
  	end
  end
end
























