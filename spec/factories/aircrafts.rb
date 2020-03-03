require 'faker'

FactoryBot.define do
  factory :aircraft do
    make { 'make' }
    model { 'model' }
    location { 'location' }
    price { 1_000_000 }
    capacity {100 }
    hours { 10_000 }
    year { 2020 }
    description { 'description' }
    association :user_id, factory: :user
  end
end
