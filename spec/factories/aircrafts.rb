require 'factory_bot_rails'
require 'faker'
include 'users'

# owner = FactoryBot.create(:user, username: Faker::Internet.username)

FactoryBot.define do
  factory :user do


    factory :aircraft do
      association :user_id, factory :user

      make 'make'
      model 'model'
      location 'location'
      price 1_000_000
      capacity 100
      hours 10_000
      year 2020
      description 'description'
    end
  end
end
