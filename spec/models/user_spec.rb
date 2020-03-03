require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  context 'username...' do
    it 'exists' do
      user = FactoryBot.build(:user, username: 'sydney')
      expect(user.username).to eq('sydney')
    end

    it 'cannot be blank' do
      user = FactoryBot.build(:user, username: '')
      expect(user).not_to be_valid
    end

    it 'must be unique' do
      FactoryBot.create(:user, username: 'BIGMAN')
      user = FactoryBot.build(:user, username: 'BIGMAN')
      expect(user).not_to be_valid
    end
  end

  context 'password...' do
    it 'exists' do
      user = FactoryBot.build(:user, password: 'password')
      expect(user.password).to eq('password')
    end

    it 'cannot be blank' do
      user = FactoryBot.build(:user, password: '')
      expect(user).not_to be_valid
    end
  end

  context 'email...' do
    it 'exist' do
      user = FactoryBot.build(:user, email: 'sbarovsky@gmail.com')
      expect(user.email).to eq('sbarovsky@gmail.com')
    end

    it 'must be unique' do
      FactoryBot.create(:user, email: 'BIGMAN@domain.com')
      user = FactoryBot.build(:user, email: 'BIGMAN@domain.com')
      expect(user).not_to be_valid
    end

    it 'must be a valid email address' do
      user = FactoryBot.build(:user, email: 'not_an_email')
      expect(user).not_to be_valid
    end
  end

  context 'has many...' do
    it 'aircrafts' do
      user = FactoryBot.create(:user)
      expect(user).to respond_to(:aircrafts)
      expect(user.aircrafts.count).to eq(0)

      air = FactoryBot.create(:aircraft, user_id: user.id)
      expect(user.aircrafts.count).to eq(1)
    end

    it 'bookings' do
      owner = FactoryBot.create(:user, username: 'owner')
      buyer = FactoryBot.create(:user, username: 'buyer')
      expect(buyer).to respond_to(:bookings)
      expect(buyer.bookings.count).to eq(0)

      air = FactoryBot.create(:aircraft, user_id: owner.id)
      booking = FactoryBot.create(:booking, { user_id: buyer.id, aircraft_id: air.id })
      expect(buyer.bookings.count).to eq(1)
    end
  end
end
