require 'rails_helper'

RSpec.describe Aircraft, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  context 'make...' do
    it 'exists' do
      air = FactoryBot.build(:aircraft, make: 'make')
      expect(air.make).to eq('make')
    end

    it 'cannot be blank' do
      attributes = valid_attributes
      attributes.delete(:make)
      air = Aircraft.new(attributes)
      expect(air).not_to be_valid
    end
  end

  context 'model...' do
    it 'exists' do
      air = Aircraft.new(model: 'model')
      expect(air.model).to eq('model')
    end

    it 'cannot be blank' do
      attributes = valid_attributes
      attributes.delete(:model)
      air = Aircraft.new(attributes)
      expect(air).not_to be_valid
    end
  end

  context 'location...' do
    it 'exists' do
      air = Aircraft.new(location: 'location')
      expect(air.location).to eq('location')
    end

    it 'cannot be blank' do
      attributes = valid_attributes
      attributes.delete(:location)
      air = Aircraft.new(attributes)
      expect(air).not_to be_valid
    end
  end

  context 'price...' do
    it 'exists' do
      air = Aircraft.new(price: 1_000_000)
      expect(air.price).to eq(1_000_000)
    end

    it 'cannot be blank' do
      attributes = valid_attributes
      attributes.delete(:price)
      air = Aircraft.new(attributes)
      expect(air).not_to be_valid
    end
  end

  context 'capacity...' do
    it 'exists' do
      air = Aircraft.new(capacity: 100)
      expect(air.capacity).to eq(100)
    end

    it 'cannot be blank' do
      attributes = valid_attributes
      attributes.delete(:capacity)
      air = Aircraft.new(attributes)
      expect(air).not_to be_valid
    end
  end

  context 'hours...' do
    it 'exists' do
      air = Aircraft.new(hours: 10_000)
      expect(air.hours).to eq(10_000)
    end

    it 'cannot be blank' do
      attributes = valid_attributes
      attributes.delete(:hours)
      air = Aircraft.new(attributes)
      expect(air).not_to be_valid
    end
  end

  context 'year...' do
    it 'exists' do
      air = Aircraft.new(year: 2020)
      expect(air.year).to eq(2020)
    end

    it 'cannot be blank' do
      attributes = valid_attributes
      attributes.delete(:year)
      air = Aircraft.new(attributes)
      expect(air).not_to be_valid
    end
  end

  context 'description...' do
    it 'exists' do
      air = Aircraft.new(description: 'description')
      expect(air.description).to eq('description')
    end

    it 'cannot be blank' do
      attributes = valid_attributes
      attributes.delete(:description)
      air = Aircraft.new(attributes)
      expect(air).not_to be_valid
    end
  end

  context 'belongs to...' do
    it 'a user' do
      air = Aircraft.new(valid_attributes)
      expect(air.user.id).to eq(user.id)
    end
  end

end
