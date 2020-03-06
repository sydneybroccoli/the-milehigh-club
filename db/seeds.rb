require 'faker'
require 'open-uri'

# LOCAL AIRCRAFT DB
AIRCRAFT_HASH = [
  {
    make: 'Cessna',
    model: '172',
    capacity: 4,
    year: rand(1956..2020),
    description: 'The Cessna 172 Skyhawk is an American four-seat, single-engine, high wing, fixed-wing aircraft made by the Cessna Aircraft Company. First flown in 1955, more 172s have been built than any other aircraft. Measured by its longevity and popularity, the Cessna 172 is the most successful aircraft in history.',
    source: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Cessna_172S_Skyhawk_SP%2C_Private_JP6817606.jpg/1200px-Cessna_172S_Skyhawk_SP%2C_Private_JP6817606.jpg',
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583461996/Cessna_172.jpg'
  },
  {
    make: 'Ilyushin',
    model: 'Il-2',
    capacity: 262,
    year: rand(1941..1945),
    description: "The Ilyushin Il-2 Shturmovik was a ground-attack aircraft produced by the Soviet Union in large numbers during the Second World War.",
    source: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Il2_sturmovik.jpg/1200px-Il2_sturmovik.jpg",
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583461998/Ilyushin_Il-2.jpg'
  },
  {
    make: 'Messerschmitt',
    model: 'BF 109',
    capacity: 10,
    year: rand(1936..1958),
    description: "The Messerschmitt Bf 109 is a German World War II fighter aircraft that was, along with the Focke-Wulf Fw 190, the backbone of the Luftwaffe's fighter force.",
    source: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Bundesarchiv_Bild_101I-662-6659-37%2C_Flugzeug_Messerschmitt_Me_109.jpg/1200px-Bundesarchiv_Bild_101I-662-6659-37%2C_Flugzeug_Messerschmitt_Me_109.jpg",
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583462013/Messerschmitt_BF-109.jpg'
  },
  {
    make: 'Piper',
    model: 'PA-28 Series',
    capacity: 2,
    year: rand(1960..2020),
    description: "The Piper PA-28 Cherokee is a family of two-seat or four-seat light aircraft built by Piper Aircraft and designed for flight training, air taxi and personal use. The PA-28 family of aircraft comprises all-metal, unpressurized, single-engined, piston-powered airplanes with low-mounted wings and tricycle landing gear.",
    source: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/PiperPA-28-236DakotaC-GGFSPhoto4.JPG/1200px-PiperPA-28-236DakotaC-GGFSPhoto4.JPG",
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583462767/Piper_PA-28-Series.jpg'
  },
  {
    make: 'Cessna',
    model: '150',
    capacity: 2,
    year: rand(1958..1986),
    description: "The Cessna 150 is a two-seat tricycle gear general aviation airplane that was designed for flight training, touring and personal use. The Cessna 150 is the fifth most produced civilian plane ever, with 23,839 aircraft produced.",
    source: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Cessna.fa150k.g-aycf.arp.jpg/1200px-Cessna.fa150k.g-aycf.arp.jpg",
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583462773/Cessna_150.jpg'
  },
  {
    make: 'Cessna',
    model: '182',
    capacity: 4,
    year: rand(1956..2020),
    description: "The Cessna 182 Skylane is an American four-seat, single-engined light airplane, built by Cessna of Wichita, Kansas. It has the option of adding two child seats, installed in the baggage area.",
    source: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Cessna182t_skylane_n2231f_cotswoldairshow_2010_arp.jpg/1200px-Cessna182t_skylane_n2231f_cotswoldairshow_2010_arp.jpg",
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583462780/Cessna_182.jpg'
  },
  {
    make: 'Supermarine',
    model: 'Spitfire',
    capacity: 1,
    year: rand(1938..1948),
    description: "The Supermarine Spitfire is a British single-seat fighter aircraft that was used by the Royal Air Force and other Allied countries before, during, and after World War II. Many variants of the Spitfire were built, using several wing configurations, and it was produced in greater numbers than any other British aircraft.",
    source: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Ray_Flying_Legends_2005-1.jpg/1200px-Ray_Flying_Legends_2005-1.jpg",
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583462787/Supermarine_Spitfire.jpg'
  },
  {
    make: 'Piper',
    model: 'J-3 Cub',
    capacity: 2,
    year: rand(1938..1947),
    description: "The Piper J-3 Cub is an American light aircraft that was built between 1938 and 1947 by Piper Aircraft. The aircraft has a simple, lightweight design which gives it good low-speed handling properties and short-field performance. ",
    source: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Piper_Cub_G%C3%B3raszka_%28cropped%29.jpg/1200px-Piper_Cub_G%C3%B3raszka_%28cropped%29.jpg",
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583462790/Piper_J-3-Cub.jpg'
  },
  {
    make: 'Focke-Wulf',
    model: 'Fw 190',
    capacity: 1,
    year: rand(1939..1945),
    description: "The Focke-Wulf Fw 190 Würger is a German single-seat, single-engine fighter aircraft designed by Kurt Tank in the late 1930s and widely used during World War II. Along with its well-known counterpart, the Messerschmitt Bf 109, the Fw 190 became the backbone of the Luftwaffe's Jagdwaffe. ",
    source: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Fw_190A-3_JG_2_in_Britain_1942.jpg/1200px-Fw_190A-3_JG_2_in_Britain_1942.jpg",
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583462795/Focke-Wulf_Fw-190.jpg'
  },
  {
    make: 'Polokarpov',
    model: 'Po-2',
    capacity: 2,
    year: rand(1928..1952),
    description: "The Polikarpov Po-2 served as a general-purpose Soviet biplane, nicknamed Kukuruznik, NATO reporting name 'Mule'.",
    source: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Bundesarchiv_Bild_169-0112%2C_Russland%2C_erbeutetes_Flugzeug_Po-2_-_restored.jpg/220px-Bundesarchiv_Bild_169-0112%2C_Russland%2C_erbeutetes_Flugzeug_Po-2_-_restored.jpg",
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583462797/Polokarpov_Po-2.jpg'
  },

  {
    make: 'Boeing',
    model: '787',
    capacity: rand(234..296),
    year: rand(2009..2020),
    description: "The Boeing 787 Dreamliner is an American long-haul, mid-size wide-body, twin-engine jet airliner manufactured by Boeing Commercial Airplanes. Its variants seat 242 to 330 passengers in typical two-class seating configurations. It is the first airliner with an airframe constructed primarily of composite materials.",
    source: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Boeing_787_N1015B_ANA_Airlines_%2827611880663%29_%28cropped%29.jpg/1200px-Boeing_787_N1015B_ANA_Airlines_%2827611880663%29_%28cropped%29.jpg",
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583462802/Boeing_787.jpg'
  },
  {
    make: 'Lockheed',
    model: 'SR-71 Blackbird',
    capacity: 2,
    year: rand(1976..1999),
    description: "The Lockheed SR-71 'Blackbird' is a long-range, high-altitude, Mach 3+ strategic reconnaissance aircraft that was operated by the United States Air Force. It was developed as a black project from the Lockheed A-12 reconnaissance aircraft in the 1960s by Lockheed and its Skunk Works division.",
    source: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Lockheed_SR-71_Blackbird.jpg/1200px-Lockheed_SR-71_Blackbird.jpg",
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583462808/Lockheed_SR-71-Blackbird.jpg'
  },
  {
    make: 'Learjet',
    model: '23',
    capacity: 6,
    year: rand(1960..1966),
    description: "The Learjet 23 is an American built six-to-eight-seat twinjet, high-speed business jet manufactured by Lear Jet. Introduced in 1964, it was Learjet's first model and created a new market for fast and efficient business aircraft. Production ended in 1966 after 101 aircraft had been delivered.",
    source: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Air_Zoo_Learjet_II.JPG/1200px-Air_Zoo_Learjet_II.JPG",
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583462812/Learjet_23.jpg'
  },
  {
    make: 'Bleriot',
    model: 'XI',
    capacity: 1,
    year: rand(1909..1930),
    description: "The Blériot XI is a French aircraft of the pioneer era of aviation. The first example was used by Louis Blériot to make the first flight across the English Channel in a heavier-than-air aircraft, on 25 July 1909.",
    source: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Bleriot_XI_Thulin_A_1910_a.jpg/1200px-Bleriot_XI_Thulin_A_1910_a.jpg",
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583462818/Bleriot_XI.jpg'
  },
  {
    make: 'Gulfstream',
    model: 'G500',
    capacity: 20,
    year: rand(2004..2020),
    description: "The Gulfstream G550 is a business jet aircraft produced by General Dynamics' Gulfstream Aerospace unit in Savannah, Georgia, US. The certification designation is GV-SP. There were 450 Gulfstream G550s in active service as of January 2016. A version with reduced fuel capacity was marketed as the G500.",
    source: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/2010-07-21_G550_NetJets_CS-DKE_EDDF_01.jpg/1200px-2010-07-21_G550_NetJets_CS-DKE_EDDF_01.jpg",
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583462823/Gulfstream_G500.jpg'
  },

  {
    make: 'Rutan',
    model: 'VariEze',
    capacity: 2,
    year: rand(1975..1982),
    description: "The Rutan VariEze is a composite, canard aircraft designed by Burt Rutan. It is a high-performance homebuilt aircraft, hundreds of which have been constructed. The design later evolved into the Long-EZ and other, larger cabin canard aircraft.",
    source: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/F-PYHS-Rutan_VariEze_%28cropped%29.jpg/220px-F-PYHS-Rutan_VariEze_%28cropped%29.jpg",
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583462830/Rutan_VariEze.jpg'
  },
  {
    make: 'Gossamer',
    model: 'Albatross',
    capacity: 1,
    year: 1979,
    description: "The Gossamer Albatross is a human-powered aircraft built by American aeronautical engineer Dr. Paul B. MacCready's company AeroVironment. On June 12, 1979, it completed a successful crossing of the English Channel to win the second £100,000 Kremer prize.",
    source: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Gossamer_Albatross_II_in_flight.jpg/1200px-Gossamer_Albatross_II_in_flight.jpg",
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583462834/Gossamer_Albatross.jpg'
  },
  {
    make: 'Bell Boeing',
    model: 'V-22 Osprey',
    capacity: 28,
    year: rand(1988..2014),
    description: "The Bell Boeing V-22 Osprey is an American multi-mission, tiltrotor military aircraft with both vertical takeoff and landing, and short takeoff and landing capabilities. It is designed to combine the functionality of a conventional helicopter with the long-range, high-speed cruise performance of a turboprop aircraft. ",
    source: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/MV-22_mcas_Miramar_2014.JPG/1200px-MV-22_mcas_Miramar_2014.JPG",
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583462841/Bell-Boeing_V-22-Osprey.jpg'
  },
  {
    make: 'General Dynamics',
    model: 'F-16',
    capacity: 1,
    year: rand(1974..2020),
    description: "The General Dynamics F-16 Fighting Falcon is a single-engine supersonic multirole fighter aircraft originally developed by General Dynamics for the United States Air Force. Designed as an air superiority day fighter, it evolved into a successful all-weather multirole aircraft.",
    source: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/F-16_June_2008.jpg/1200px-F-16_June_2008.jpg",
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583462844/General-Dynamics_F-16.jpg'
  },
  {
    make: 'Sikorsky',
    model: 'UH-60 Blackhawk',
    capacity: 11,
    year: rand(1979..2020),
    description: "The Sikorsky UH-60 Black Hawk is a four-blade, twin-engine, medium-lift utility helicopter manufactured by Sikorsky Aircraft. Sikorsky submitted the S-70 design for the United States Army's Utility Tactical Transport Aircraft System competition in 1972.",
    source: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/UH-60_2nd_Squadron%2C_2nd_Cavalry_Regiment_%28cropped%29.jpg/1200px-UH-60_2nd_Squadron%2C_2nd_Cavalry_Regiment_%28cropped%29.jpg",
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583462847/Sikorsky_UH-60-Blackhawk.jpg'
  },
  {
    make: 'JetMan',
    model: 'Pack',
    capacity: 1,
    year: rand(1960..2020),
    description: "Yves Rossy is a Swiss military-trained pilot and an aviation enthusiast. He is known as the inventor of a series of experimental individual jet packs, the latest using carbon-fiber wings for flight.",
    source: "https://www.geeky-gadgets.com/wp-content/uploads/2018/11/Jetman-documentary-teaser-trailer.jpg",
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583462853/JetMan_Pack.jpg'
  }
]

# PROFILE IMAGES DB
PROFILE_HASH = [
  { source: 'https://images.pexels.com/photos/2825952/pexels-photo-2825952.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583463366/avatar_0.jpg' },
  { source: 'https://images.pexels.com/photos/3771639/pexels-photo-3771639.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583463367/avatar_1.jpg' },
  { source: 'https://images.pexels.com/photos/3812724/pexels-photo-3812724.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583463369/avatar_2.jpg' },
  { source: 'https://images.pexels.com/photos/3764123/pexels-photo-3764123.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583463371/avatar_3.jpg' },
  { source: 'https://images.pexels.com/photos/3845494/pexels-photo-3845494.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583463374/avatar_4.jpg' },
  { source: 'https://images.pexels.com/photos/3846166/pexels-photo-3846166.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583463375/avatar_5.jpg' },
  { source: 'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583463378/avatar_6.jpg' },
  { source: 'https://images.pexels.com/photos/3831645/pexels-photo-3831645.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583463380/avatar_7.jpg' },
  { source: 'https://images.pexels.com/photos/3760045/pexels-photo-3760045.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583463382/avatar_8.jpg' },
  { source: 'https://images.pexels.com/photos/3779461/pexels-photo-3779461.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    cloud: 'https://res.cloudinary.com/dviligmqb/image/upload/v1583463385/avatar_9.jpg' }
]

# #UPLOAD ALL IMAGES TO CLOUDINARY
# #SHOULD NOT NEED TO BE UNCOMMENTED
# puts 'Uploading/Checking Cloudinary for images...'
# AIRCRAFT_HASH.each do |tmp|
#   Cloudinary::Uploader.upload(tmp[:source],
#   {
#     public_id: "#{tmp[:make].gsub(' ', '-')}_#{tmp[:model].gsub(' ', '-')}"
#   })
# end

# i = 0
# puts 'Uploading/Checking Cloudinary for images...'
# PROFILE_HASH.each do |tmp|
#   Cloudinary::Uploader.upload(tmp[:source],
#   {
#     public_id: "avatar_#{i}"
#   })
#   i += 1
# end


puts 'Cleaning database...'
Review.destroy_all
Booking.destroy_all
Aircraft.destroy_all
User.destroy_all

puts 'Creating new database...'

owners_array = Array.new
aircrafts_array = Array.new
buyers_array = Array.new
bookings_array = Array.new
reviews_array = Array.new

i = 0
5.times do
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  owner = User.new(
    first_name: first,
    last_name: last,
    password: 'password',
    email: Faker::Internet.email(name: "#{first} #{last}", separators: '.')
    )
  num = rand(0..9)
  file = URI.open(PROFILE_HASH[num][:cloud])
    owner.photo.attach(io: file,
      filename:("avatar_#{i}.jpg"),
      content_type: 'image/jpg')

  owner.save!
  puts "  #{owner.first_name} #{owner.last_name} has created an account!"
  owners_array << owner

  rand(2..5).times do

    tmp = AIRCRAFT_HASH.sample
    # puts "\tcreating a #{tmp[:make]} #{tmp[:model]}..."

    aircraft = Aircraft.new(
      make: tmp[:make],
      model: tmp[:model],
      location: Faker::Address.time_zone,
      unit_price: rand(100..1_000),
      capacity: tmp[:capacity],
      hours: Faker::Vehicle.mileage.to_i,
      year: tmp[:year],
      description: tmp[:description],
      user_id: owner.id
    )
    file = URI.open(tmp[:cloud])
    aircraft.photos.attach(io: file,
      filename:("#{tmp[:make].gsub(' ', '-')}_#{tmp[:model].gsub(' ', '-')}.jpg"),
      content_type: 'image/jpg')

    puts "\ta #{tmp[:make]} #{tmp[:model]} has been listed!"

    aircraft.save!
    until aircraft.geocoded?
      aircraft[:location] = Faker::Address.time_zone
    end
    aircraft.save!

    aircrafts_array << aircraft

    sleep(2.seconds)

    i += 1
  end
end

aircrafts_array.each do |aircraft|
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  buyer = User.new(
    first_name: first,
    last_name: last,
    password: 'password',
    email: Faker::Internet.email(name: "#{first} #{last}", separators: '.')
  )
  num = rand(0..9)
  file = URI.open(PROFILE_HASH[num][:cloud])
    buyer.photo.attach(io: file,
      filename:("avatar_#{i}.jpg"),
      content_type: 'image/jpg')

  buyer.save!
  puts "  #{buyer.first_name} #{buyer.last_name} has created an account!"

  buyers_array << buyer
  seen = [true, false].sample
  if seen
    confirm = [true, false][rand(0..1)]
  else
    confirm = false
  end

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
    final_price: aircraft.unit_price * (final - start)
  )
  booking.save!
  puts "\ta booking has been made!"

  bookings_array << booking

  review = Review.new(
    rating: rand(0..10),
    content: Faker::Hipster.paragraph,
    booking_id: booking.id,
    user_id: buyer.id
    )
  review.save!
  puts "\ta review has been added!"

  reviews_array << review


end
