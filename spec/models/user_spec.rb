require 'rails_helper'
# require 'factory_bot_rails'
# include FactoryBot::Syntax::Methods

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
    end

    it 'transactions' do
    end

    it 'reviews' do
    end
  end

  # it 'has many aircrafts' do
  #   user = User.create!(valid_attributes)
  #   expect(user).to respond_to(:aircrafts)
  #   expect(user.aircrafts.count).to eq(0)
  #   aircraft = Aircraft.create(
  #     make: 'make',
  #     model: 'model',
  #     location: 'location',
  #     price: 1_000_000,
  #     capacity: 100,
  #     hours: 10_000,
  #     year: 2020,
  #     description: 'description',
  #     user_id: user.id
  #     )
  #   expect(user.aircrafts.count).to eq(1)
  # end
  # User.where(username: 'sydney').destroy_all

  # it 'should destroy_all aircrafts when destroy_alling self' do
  #   user = User.create!(valid_attributes)
  #   aircraft = Aircraft.create(
  #     make: 'make',
  #     model: 'model',
  #     location: 'location',
  #     price: 1_000_000,
  #     capacity: 100,
  #     hours: 10_000,
  #     year: 2020,
  #     description: 'description',
  #     user_id: user.id
  #     )
  #   expect{ user.destroy }.to change { Aircraft.count }.from(1).to(0)
  # end
  # User.where(username: 'sydney').destroy_all

  # it 'has many transactions' do
  #   user = User.create!(valid_attributes)
  #   expect(user).to respond_to(:transactions)
  #   expect(user.transactions).to eq(0)
  # end
  # User.where(username: 'sydney').destroy_all

  # it 'has many reviews' do
  #   user = User.create!(valid_attributes)
  #   expect(user).to respond_to(:transactions)
  #   expect(user.transactions).to eq(0)
  # end
  # User.where(username: 'sydney').destroy_all

end
