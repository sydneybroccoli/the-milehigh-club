require 'faker'

puts 'Cleaning database...'
Review.destroy_all
Booking.destroy_all
Aircraft.destroy_all
User.destroy_all

puts 'Creating new database...'

aircrafts_array = []
owners_array = []
buyers_array = []
bookings_array = []
reviews_array = []

5.times do
  username = Faker::Internet.username
  owner = User.new(
    username: username,
    password: 'password',
    email: Faker::Internet.email(name: username)
  )
  owner.save
  owners_array << owner

  2.times do
    aircraft = Aircraft.new(
      make: Faker::Vehicle.make,
      model: Faker::Vehicle.model,
      location: Faker::Address.time_zone,
      price: rand(1_000_000..10_000_000),
      capacity: rand(100..500),
      hours: Faker::Vehicle.mileage.to_i,
      year: Faker::Vehicle.year.to_i,
      description: Faker::Vehicle.standard_specs.join,
      user_id: owner.id
    )
    aircraft.save
    aircrafts_array << aircraft

  end
end

5.times do
  username = Faker::Internet.username
  buyer = User.new(
    username: username,
    password: 'password',
    email: Faker::Internet.email(name: username)
  )
  buyer.save
  buyers_array << buyer
  seen = [true, false].sample
  if seen
    confirm = [true, false][rand(0..1)]
  else
    confirm = false
  end

  aircraft = aircrafts_array.sample
  start = Date.today
  final = Faker::Date.between(from: 30.days.from_now, to: Date.today)
  booking = Booking.new(
    booking_type: 'rental',
    start_date: start,
    end_date: final,
    seen: seen,
    confirm: confirm,
    user_id: buyer.id,
    aircraft_id: aircraft.id,
    final_price: aircraft.price * (final - start)
  )
  booking.save
  bookings_array << booking

  review = Review.new(
    rating: rand(0..10),
    content: Faker::Hipster.sentence,
    booking_id: booking.id,
    )
  review.save
  reviews_array << review


end


