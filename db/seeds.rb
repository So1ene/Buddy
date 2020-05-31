require "open-uri"


# => Generate languages

def generate_languages
  SpokenLanguage.destroy_all
  Language.destroy_all
  puts ""
  puts "> Destroyed all langua-...qwalnasdekj1010010 :("
  %w[English French German Spanish Japanese Arabic Russian Portuguese Indonesian Hindi Mandarin Other].each do |language|
    Language.create!(name: language)
  end
  puts ""
  puts "> Generated languages, could add more....  lol"
  puts ""
end


# => Generate users

def generate_users

  # => Generate solene@email.com, password 123456
  solene = User.new(email: "solene@email.com",
           password: "123456",
           first_name: "Solène",
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
  SpokenLanguage.create!(user: User.find(1), language: Language.find_by(name: "English"))
  SpokenLanguage.create!(user: User.find(1), language: Language.find_by(name: "French"))
  SpokenLanguage.create!(user: User.find(2), language: Language.find_by(name: "English"))
  SpokenLanguage.create!(user: User.find(3), language: Language.find_by(name: "English"))
  SpokenLanguage.create!(user: User.find(4), language: Language.find_by(name: "English"))
  SpokenLanguage.create!(user: User.find(4), language: Language.find_by(name: "French"))
  puts "> Attached languages to users"
  puts ""
end

# => Getting ready to generate events

def attach_image(event, counter)
  event_urls = ["https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534238/Buddy/event9_l50xz0.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534238/Buddy/event11_yejiuj.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534238/Buddy/event6_huhh2b.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534239/Buddy/event12_cnifny.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534239/Buddy/event5_swmkbh.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534239/Buddy/event1_m9i2h6.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534239/Buddy/event7_odrnin.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534239/Buddy/event2_w7znmo.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534238/Buddy/event3_orhjmb.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534238/Buddy/event8_kt62wn.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534238/Buddy/event10_lkugex.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944323/Buddy/event4_xokpx4.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944323/Buddy/event2_mpz94s.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944323/Buddy/event1_ltudjt.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944323/Buddy/event9_hmkdqm.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534239/Buddy/event4_vrdvrg.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944324/Buddy/event6_zeu3nn.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944324/Buddy/event8_vfvett.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944324/Buddy/event5_w07laq.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944324/Buddy/event7_rn3nas.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944324/Buddy/event10_k92js7.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944324/Buddy/event11_ljiuwg.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944324/Buddy/event12_gyhz2x.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944324/Buddy/event3_b4httm.jpg"]
  file = URI.open(event_urls[counter])
  event.photo.attach(io: file, filename: "image#{counter}.jpg", content_type: 'image/jpg')
end

def generate_categories
  EventCategory.destroy_all
  Category.destroy_all
  puts ""
  puts "> Destroyed all categories"
  Category.create!(name: "outdoors", id: 1)
  Category.create!(name: "live music", id: 2)
  Category.create!(name: "food", id: 3)
  Category.create!(name: "drinks", id: 4)
  Category.create!(name: "sports", id: 5)
  Category.create!(name: "theater", id: 6)
  Category.create!(name: "festival", id: 7)
  Category.create!(name: "other", id: 8)
    puts ""
  puts "> Created 8 categories"
  puts ""
end

def event_name(counter)
  return "Fireworks" if counter == 0
  return "Movie Theater" if counter == 1
  return "Golfing" if counter == 2
  return "Lion King Show" if counter == 3
  return "Concert" if counter == 4
  return "Football Match" if counter == 5
  return "Karaoke Night" if counter == 6
  return "Pink Party" if counter == 7
  return "Just Drinks" if counter == 8
  return "Dinner at Herbert's" if counter == 9
  return "Summer festival" if counter == 10
  return "Beach relaxation" if counter == 11
  return "Ice Skating" if counter == 12
  return "Skiing" if counter == 13
  return "Hot-Air Balloon Ride" if counter == 14
  return "Theater Show" if counter == 15
  return "Downtown Fun" if counter == 16
  return "Pink Party" if counter == 17
  return "Surfing" if counter == 18
  return "Rave" if counter == 19
  return "Light Garden" if counter == 20
  return "Theme Park" if counter == 21
  return "Open Mic Night" if counter == 22
  return "Hike with Me" if counter == 23
end


# => Generate events

def generate_events
  Event.destroy_all
  puts ""
  puts "> Destroyed all events"

  counter = 0
  User.all.each do |user|
    3.times do
      event = Event.new(user: user,
                        name: event_name(counter),
                        date_time: Faker::Time.between_dates(from: Date.today - 5, to: Date.today + 12, period: :day),
                        address: Faker::Address.street_address + ", Montreal QC",
                        description: Faker::Lorem.sentence(word_count: rand(20))
                        )
      attach_image(event, counter)
      event.save!
      counter += 1
      first_id = rand(1..8)
      random = rand(1..8)
      second_id = random unless random == first_id
      random = rand(1..8)
      third_id = random unless random == first_id || random == second_id
      EventCategory.create!(event: event, category: Category.find(first_id))
      EventCategory.create!(event: event, category: Category.find(second_id)) unless second_id.nil?
      EventCategory.create!(event: event, category: Category.find(third_id)) unless third_id.nil?
    end
  end
  User.all.each do |user|
    3.times do
      event = Event.new(user: user,
                        name: event_name(counter),
                        date_time: Faker::Time.between_dates(from: Date.today + 13, to: Date.today + 30, period: :day),
                        address: Faker::Address.street_address + ", Montreal QC,
                        description: Faker::Lorem.sentence(word_count: rand(20))
                        )
      attach_image(event, counter)
      event.save!
      counter += 1
      first_id = rand(1..8)
      random = rand(1..8)
      second_id = random unless random == first_id
      random = rand(1..8)
      third_id = random unless random == first_id || random == second_id
      EventCategory.create!(event: event, category: Category.find(first_id))
      EventCategory.create!(event: event, category: Category.find(second_id)) unless second_id.nil?
      EventCategory.create!(event: event, category: Category.find(third_id)) unless third_id.nil?
    end
  end

  puts ""
  puts "> Gave each user 6 events"
  puts ""
  puts "> Attached pictures to events"
  puts "> Attached categories to events"
  puts ""
end

# => Generate requests

def generate_requests
  Request.destroy_all
  puts ""
  puts "> Destroyed all requests"
  counter = 0
  4.times do
    counter += 1
    Event.all.each do |event|
      unless event.user_id == counter
        Request.new(user_id: counter,
                    motivation: Faker::Lorem.sentence(word_count: rand(20)),
                    status: "Pending",
                    event: event
                    ).save!
      end
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

def generate_accepted_requests
  Request.find_by(user_id: 1, event: Event.where(user_id: 2).first).update(status: "Accepted")
  Request.find_by(user_id: 1, event: Event.where(user_id: 3).first).update(status: "Accepted")
  Request.find_by(user_id: 1, event: Event.where(user_id: 4).first).update(status: "Accepted")
  Request.find_by(user_id: 2, event: Event.where(user_id: 1).first).update(status: "Accepted")
  Request.find_by(user_id: 2, event: Event.where(user_id: 3).second).update(status: "Accepted")
  Request.find_by(user_id: 2, event: Event.where(user_id: 4).second).update(status: "Accepted")
  Request.find_by(user_id: 3, event: Event.where(user_id: 1).second).update(status: "Accepted")
  Request.find_by(user_id: 3, event: Event.where(user_id: 2).second).update(status: "Accepted")
  Request.find_by(user_id: 3, event: Event.where(user_id: 4).third).update(status: "Accepted")
  Request.find_by(user_id: 4, event: Event.where(user_id: 1).third).update(status: "Accepted")
  Request.find_by(user_id: 4, event: Event.where(user_id: 2).third).update(status: "Accepted")
  Request.find_by(user_id: 4, event: Event.where(user_id: 3).third).update(status: "Accepted")
  puts ""
  puts "> Generated some accepted requests (to test inbox)"
  puts ""
end

generate_languages
generate_users
generate_categories
generate_events
generate_requests
generate_accepted_requests
generate_messages
