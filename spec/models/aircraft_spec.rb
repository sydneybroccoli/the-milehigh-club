require 'rails_helper'

RSpec.describe Aircraft, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'make...' do
    it 'exists' do
      air = FactoryBot.build(:aircraft, make: 'make')
      expect(air.make).to eq('make')
    end

    it 'cannot be blank' do
      air = FactoryBot.build(:aircraft, make: '')
      expect(air).not_to be_valid
    end
  end

  context 'model...' do
    it 'exists' do
      air = FactoryBot.build(:aircraft, model: 'model')
      expect(air.model).to eq('model')
    end

    it 'cannot be blank' do
      air = FactoryBot.build(:aircraft, model: '')
      expect(air).not_to be_valid
    end
  end

  context 'location...' do
    it 'exists' do
      air = FactoryBot.build(:aircraft, location: 'location')
      expect(air.location).to eq('location')
    end

    it 'cannot be blank' do
      air = FactoryBot.build(:aircraft, location: '')
      expect(air).not_to be_valid
    end
  end

  context 'price...' do
    it 'exists' do
      air = FactoryBot.build(:aircraft, price: 1_000_000)
      expect(air.price).to eq(1_000_000)
    end

    it 'cannot be blank' do
      air = FactoryBot.build(:aircraft, price: nil)
      expect(air).not_to be_valid
    end
  end

  context 'capacity...' do
    it 'exists' do
      air = FactoryBot.build(:aircraft, capacity: 100)
      expect(air.capacity).to eq(100)
    end

    it 'cannot be blank' do
      air = FactoryBot.build(:aircraft, capacity: nil)
      expect(air).not_to be_valid
    end
  end

  context 'hours...' do
    it 'exists' do
      air = FactoryBot.build(:aircraft, hours: 10_000)
      expect(air.hours).to eq(10_000)
    end

    it 'cannot be blank' do
      air = FactoryBot.build(:aircraft, hours: nil)
      expect(air).not_to be_valid
    end
  end

  context 'year...' do
    it 'exists' do
      air = FactoryBot.build(:aircraft, year: 2020)
      expect(air.year).to eq(2020)
    end

    it 'cannot be blank' do
      air = FactoryBot.build(:aircraft, year: nil)
      expect(air).not_to be_valid
    end
  end

  context 'description...' do
    it 'exists' do
      air = FactoryBot.build(:aircraft, description: 'description')
      expect(air.description).to eq('description')
    end

    it 'cannot be blank' do
      air = FactoryBot.build(:aircraft, description: '')
      expect(air).not_to be_valid
    end
  end

  context 'belongs to...' do
    it 'a user' do
      user = FactoryBot.create(:user)
      air = FactoryBot.create(:aircraft, user_id: user.id)
      expect(air.user.id).to eq(user.id)
    end
  end
end
