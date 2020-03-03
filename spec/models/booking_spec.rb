require 'rails_helper'

RSpec.describe Booking, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  buyer = User.create(
    username: 'joe',
    password: 'password',
    email: 'joe0@gmail.com'
    )
  owner = User.create(
    username: 'sydney',
    password: 'password',
    email: 'sbarovsky@gmail.com'
    )
  aircraft = Aircraft.create(
      make: 'make',
      model: 'model',
      location: 'location',
      price: 1_000_000,
      capacity: 100,
      hours: 10_000,
      year: 2020,
      description: 'description',
      user_id: owner.id
    )

  valid_attributes = {
    booking_type: 'sale',
    start_date: Date.today,
    end_date: Date.tomorrow,
    seen: true,
    confirm: true,
    user_id: buyer.id,
    aircraft_id: aircraft.id,
    final_price: aircraft.price * (Date.tomorrow - Date.today)
  }
end
