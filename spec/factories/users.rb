FactoryBot.define do
  factory :user do
    username { 'sydney' }
    password { 'password' }
    email { "#{username}@domain.com" }
  end
end
