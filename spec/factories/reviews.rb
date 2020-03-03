FactoryBot.define do
  factory :reviews do
    association :booking_id, :booking
    association :user_id, :user
    content { 'content' }
    rating { 10 }
  end
end
