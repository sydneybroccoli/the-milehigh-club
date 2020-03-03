FactoryBot.define do
  factory :transaction do
    transaction_type { 'rental' }
    start_date { Date.today }
    end_date { Date.tomorrow }
    seen { true }
    confirm { true }
    association :user_id, :user
    association :aircraft_id, :aircraft
    final_price { 10_000_000 }

  end
end
