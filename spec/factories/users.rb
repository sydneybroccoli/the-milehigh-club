FactoryBot.define do
  factory :user do
    username { 'sydney' }
    password { 'password' }
    email { "#{username}@domain.com" }
  end

  trait :owner do
    username { 'owner' }
  end

  trait :renter do
    username { 'renter' }
  end
end
