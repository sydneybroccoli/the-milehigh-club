FactoryBot.define do
  factory :reviews do
    association :transaction_id, :transaction
    association :user_id, :user
    content { 'content' }
    rating { 10 }
  end
end
