require "open-uri"


# => Generate users

def generate_users
  # => Generate solene@email.com, password 123456
  solene = User.new(email: "solene@email.com",
           password: "123456",
           first_name: "Solene",
           last_name: "Duprat",
           age: 22,
           bio: "My name is Solene and I love dogs!",
           living_in: "Montreal"
           )
  solene.photo.attach(io: URI.open("https://res.cloudinary.com/dkbbawtjw/image/upload/v1590161778/solene.jpg"), filename: "solene.jpg", content_type: 'image/jpg')
  solene.save
  # => Generate daniela@email.com, password 123456
  daniela = User.new(email: "daniela@email.com",
           password: "123456",
           first_name: "Daniela",
           last_name: "Santana",
           age: 27,
           bio: "My name is Daniela and I love cats!",
           living_in: "Montreal"
           )
  daniela.photo.attach(io: URI.open("https://res.cloudinary.com/dkbbawtjw/image/upload/v1590161934/daniela_loxgl0.jpg"), filename: "daniela.jpg", content_type: 'image/jpg')
  daniela.save
  # => Generate celine@email.com, password 123456
  celine = User.new(email: "celine@email.com",
           password: "123456",
           first_name: "Celine",
           last_name: "Rondeau",
           age: 27,
           bio: "My name is Celine and I'm very awesome!",
           living_in: "Montreal"
           )
  celine.photo.attach(io: URI.open("https://res.cloudinary.com/dkbbawtjw/image/upload/v1590161759/celine.jpg"), filename: "celine.jpg", content_type: 'image/jpg')
  celine.save
  # => Generate samantha@email.com, password 123456
  samantha = User.new(email: "samantha@email.com",
           password: "123456",
           first_name: "Samantha",
           last_name: "André",
           age: 37,
           bio: "My name is Samantha and I'm very beautiful!",
           living_in: "Montreal"
           )
  samantha.photo.attach(io: URI.open("https://res.cloudinary.com/dkbbawtjw/image/upload/v1590161980/samantha_tuybqx.jpg"), filename: "samantha.jpg", content_type: 'image/jpg')
  samantha.save
  # => Console messages

  puts ""
  puts "> Generated users: solene@email.com, daniela@email.com, celine@email.com, samantha@email.com - password: '123456'"
  puts ""
  puts "> Attached profile pictures to users"
  puts ""
end

def attach_image(event, counter)
  event_urls = ["https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928724/art-bnb/paintings/painting20_ockfp2.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928661/art-bnb/paintings/painting4_d984nt.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928657/art-bnb/paintings/painting8_iznx7y.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928656/art-bnb/paintings/painting5_iypu5m.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928656/art-bnb/paintings/painting7_xu2l1s.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928655/art-bnb/paintings/painting2_lv0jx2.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928655/art-bnb/paintings/painting19_bjlfa4.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928655/art-bnb/paintings/painting6_pls0ck.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928654/art-bnb/paintings/painting11_mlog0v.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928654/art-bnb/paintings/painting9_bot1zq.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928653/art-bnb/paintings/painting15_duxzb7.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1589928653/art-bnb/paintings/painting18_zgt3yv.jpg"]
  file = URI.open(event_urls[counter])
  event.photo.attach(io: file, filename: "image#{counter}.jpg", content_type: 'image/jpg')
  counter += 1
end

Event.destroy_all
puts "> Destroyed all events"

def generate_events
  counter = 0
  User.all.each do |user|
    3.times do
      date = Faker::Date.forward(days: 14)
      event = Event.new(user: user,
                        name: Faker::Lorem.sentence(word_count: 2),
                        date: date,
                        time: Faker::Time.between_dates(from: date - 1, to: date, period: :day), # .strftime("%I:%M%p")
                        address: Faker::Address.full_address,
                        description: Faker::Lorem.sentence(word_count: rand(20))
                        )
      attach_image(event, counter)
      event.save!
    end
  end
  puts ""
  puts "> Gave each user 3 events"
  puts ""
  puts "> Attached pictures to events"
  puts ""
end

%w[English French German Spanish Japanese Arabic Russion Portuguese Indonesian Hindi Mandarin Other].each do |language|
    Language.create(name: language)
  end
puts "> Generated languages, could add more...."



generate_users
generate_events
