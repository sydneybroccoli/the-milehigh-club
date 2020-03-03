require 'faker'

puts 'Cleaning database...'
Review.destroy_all
Transaction.destroy_all
Aircraft.destroy_all
User.destroy_all

puts 'Creating new database...'

aircrafts_array = []
sellers_array = []
buyers_array = []
transactions_array = []
reviews_array = []

5.times do
  username = Faker::Internet.username
  user = User.new(
    username: username,
    password: 'password',
    email: Faker::Internet.email(name: username)
  )
  user.save
  sellers_array << user

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
      user_id: user.id
    )
    aircraft.save
    aircrafts_array << aircraft

  end
end

5.times do
  username = Faker::Internet.username
  user = User.new(
    username: username,
    password: 'password',
    email: Faker::Internet.email(name: username)
  )
  user.save
  buyers_array << user
  seen = [true, false].sample
  if seen
    confirm = [true, false][rand(0..1)]
  else
    confirm = false
  end

  aircraft = aircrafts_array.sample
  start = Date.today
  final = Faker::Date.between(from: 30.days.from_now, to: Date.today)
  transaction = Transaction.new(
    transaction_type: ['sale','rental'].sample,
    start_date: start,
    end_date: final,
    seen: seen,
    confirm: confirm,
    user_id: user.id,
    aircraft_id: aircraft.id,
    final_price: aircraft.price * (final - start)
  )
  transaction.save
  transactions_array << transaction

  review = Review.new(
    rating: rand(0..10),
    content: Faker::Hipster.sentence,
    transaction_id: transaction.id,
    user_id: user.id
    )
  review.save
  reviews_array << review


end


