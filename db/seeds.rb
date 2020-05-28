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
  puts ""
  puts "> Generated users: solene@email.com, daniela@email.com, celine@email.com, samantha@email.com - password: '123456'"
  puts ""
  puts "> Attached profile pictures to users"
  puts ""
end


# => Getting ready to generate events

def attach_image(event, counter)
  event_urls = ["https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534239/Buddy/event4_vrdvrg.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534238/Buddy/event9_l50xz0.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534238/Buddy/event11_yejiuj.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534238/Buddy/event6_huhh2b.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534239/Buddy/event12_cnifny.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534239/Buddy/event5_swmkbh.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534239/Buddy/event1_m9i2h6.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534239/Buddy/event7_odrnin.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534239/Buddy/event2_w7znmo.jpg.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534238/Buddy/event3_orhjmb.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534238/Buddy/event8_kt62wn.jpg",
                   "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534238/Buddy/event10_lkugex.jpg"]
  file = URI.open(event_urls[counter])
  event.photo.attach(io: file, filename: "image#{counter}.jpg", content_type: 'image/jpg')
  counter += 1
end


# => Generate events

def generate_events
  Event.destroy_all
  puts ""
  puts "> Destroyed all events"
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

# => Generate requests

def generate_requests
  Request.destroy_all
  puts ""
  puts "> Destroyed all requests"
  counter = 0
  user_id_range = (User.last.id-3)..User.last.id
  Event.all.each do |event|
    3.times do
      request = Request.new(user: User.find(rand(user_id_range)),
                        motivation: Faker::Lorem.sentence(word_count: rand(180)),
                        status: "Pending",
                        event: event
                        )
      request.save!
    end
  end
  puts ""
  puts "> Gave each event 3 requests"
  puts ""
end

# => Generate messages

def generate_messages
  Message.destroy_all
  puts ""
  puts "> Destroyed all messages"
  solene = User.first
  daniela = User.second
  celine = User.third
  samantha = User.fourth
  Message.create(receiver: solene, sender: daniela, content: "hello Solene from Daniela")
  Message.create(receiver: solene, sender: celine, content: "hello Solene from Celine")
  Message.create(receiver: solene, sender: samantha, content: "hello Solene from Samantha")
  Message.create(receiver: daniela, sender: solene, content: "hello Daniela from Solene")
  Message.create(receiver: daniela, sender: celine, content: "hello Daniela from Celine")
  Message.create(receiver: daniela, sender: samantha, content: "hello Daniela from Samantha")
  Message.create(receiver: celine, sender: solene, content: "hello Celine from Solene")
  Message.create(receiver: celine, sender: daniela, content: "hello Celine from Daniela")
  Message.create(receiver: celine, sender: samantha, content: "hello Celine from Samantha")
  Message.create(receiver: samantha, sender: solene, content: "hello Samantha from Solene")
  Message.create(receiver: samantha, sender: celine, content: "hello Samantha from Celine")
  Message.create(receiver: samantha, sender: daniela, content: "hello Samantha from Daniela")
  puts ""
  puts "> Generated messages"
  puts ""
end


# => Generate languages

def generate_languages
  Language.destroy_all
  puts ""
  puts "> Destroyed all langua-...qwalnasdekj1010010 :("
  %w[English French German Spanish Japanese Arabic Russian Portuguese Indonesian Hindi Mandarin Other].each do |language|
    Language.create(name: language)
  end
  puts ""
  puts "> Generated languages, could add more....  lol"
  puts ""
end

generate_languages
generate_users
generate_events
generate_messages
generate_requests
