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
           bio: "My name is Solene and I love dogs! I love outdoor acitivties, invite me to hike with you, I'll bring my dog!",
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
           bio: "Hi! I'm from Brazil, living in Montreal, and always waiting for my next adventure! Let's explore together!",
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
           bio: "Hi! I am new in town and I am looking to meet all kinds of new people! Let me know if you are interested :)",
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
           bio: "Hi! I am originally from France, currently living in Montreal. Happy to meet folks from all walks of life!",
           living_in: "Montreal"
           )
  samantha.photo.attach(io: URI.open("https://res.cloudinary.com/dkbbawtjw/image/upload/v1590161980/samantha_tuybqx.jpg"), filename: "samantha.jpg", content_type: 'image/jpg')
  samantha.save
  stephane = User.new(email: "stephane@email.com",
           password: "123456",
           first_name: "Stephane",
           last_name: "Lafontaine",
           age: 53,
           bio: "My name is Stephane and I love Ruby!",
           living_in: "Montreal"
           )
  stephane.photo.attach(io: URI.open("https://res.cloudinary.com/dkbbawtjw/image/upload/v1591254821/Buddy/stephane_qxq09j.jpg"), filename: "stephane.jpg", content_type: 'image/jpg')
  stephane.save
  puts ""
  puts "> Generated users: solene@email.com, daniela@email.com, celine@email.com, samantha@email.com, and 1 secret user ;) - password: '123456'"
  puts ""
  puts "> Attached profile pictures to users"
  SpokenLanguage.create!(user: User.find(1), language: Language.find_by(name: "English"))
  SpokenLanguage.create!(user: User.find(1), language: Language.find_by(name: "French"))
  SpokenLanguage.create!(user: User.find(2), language: Language.find_by(name: "English"))
  SpokenLanguage.create!(user: User.find(3), language: Language.find_by(name: "English"))
  SpokenLanguage.create!(user: User.find(4), language: Language.find_by(name: "English"))
  SpokenLanguage.create!(user: User.find(4), language: Language.find_by(name: "French"))
  SpokenLanguage.create!(user: User.find(5), language: Language.find_by(name: "English"))
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
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590534239/Buddy/event4_vrdvrg.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944323/Buddy/event2_mpz94s.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944323/Buddy/event1_ltudjt.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944323/Buddy/event9_hmkdqm.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944323/Buddy/event4_xokpx4.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944324/Buddy/event6_zeu3nn.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944324/Buddy/event8_vfvett.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944324/Buddy/event7_rn3nas.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944324/Buddy/event5_w07laq.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944324/Buddy/event12_gyhz2x.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944324/Buddy/event3_b4httm.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944324/Buddy/event10_k92js7.jpg",
                "https://res.cloudinary.com/dkbbawtjw/image/upload/v1590944324/Buddy/event11_ljiuwg.jpg"]

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
  puts "> Created 8 categories"
  puts ""
end

def assign_random_categories(event)
  first_id = rand(1..8)
  random = rand(1..8)
  second_id = random unless random == first_id
  random = rand(1..8)
  third_id = random unless random == first_id || random == second_id
  EventCategory.create!(event: event, category: Category.find(first_id))
  EventCategory.create!(event: event, category: Category.find(second_id)) unless second_id.nil?
  EventCategory.create!(event: event, category: Category.find(third_id)) unless third_id.nil?
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
  return "Dinner at Jerry's" if counter == 9
  return "Summer festival" if counter == 10
  return "Theater Show" if counter == 11
  return "Ice Skating" if counter == 12
  return "Skiing" if counter == 13
  return "Hot-Air Balloon" if counter == 14
  return "Beach Day" if counter == 15
  return "Downtown Fun" if counter == 16
  return "Pink Afterparty" if counter == 17
  return "Electro Concert" if counter == 18
  return "Surfing" if counter == 19
  return "Open Mic Day" if counter == 20
  return "Hike with Me" if counter == 21
  return "Light Garden" if counter == 22
  return "Theme Park" if counter == 23
end


# => Fix categories

def fix_categories
  EventCategory.create!(event: Event.find_by(name: "Fireworks"), category: Category.find_by(name: "outdoors"))
  EventCategory.create!(event: Event.find_by(name: "Fireworks"), category: Category.find_by(name: "festival"))
  EventCategory.create!(event: Event.find_by(name: "Movie Theater"), category: Category.find_by(name: "other"))
  EventCategory.create!(event: Event.find_by(name: "Golfing"), category: Category.find_by(name: "sports"))
  EventCategory.create!(event: Event.find_by(name: "Golfing"), category: Category.find_by(name: "outdoors"))
  EventCategory.create!(event: Event.find_by(name: "Lion King Show"), category: Category.find_by(name: "theater"))
  EventCategory.create!(event: Event.find_by(name: "Lion King Show"), category: Category.find_by(name: "live music"))
  EventCategory.create!(event: Event.find_by(name: "Concert"), category: Category.find_by(name: "live music"))
  EventCategory.create!(event: Event.find_by(name: "Concert"), category: Category.find_by(name: "drinks"))
  EventCategory.create!(event: Event.find_by(name: "Concert"), category: Category.find_by(name: "outdoors"))
  EventCategory.create!(event: Event.find_by(name: "Football Match"), category: Category.find_by(name: "sports"))
  EventCategory.create!(event: Event.find_by(name: "Football Match"), category: Category.find_by(name: "outdoors"))
  EventCategory.create!(event: Event.find_by(name: "Karaoke Night"), category: Category.find_by(name: "live music"))
  EventCategory.create!(event: Event.find_by(name: "Karaoke Night"), category: Category.find_by(name: "drinks"))
  EventCategory.create!(event: Event.find_by(name: "Karaoke Night"), category: Category.find_by(name: "other"))
  EventCategory.create!(event: Event.find_by(name: "Pink Party"), category: Category.find_by(name: "food"))
  EventCategory.create!(event: Event.find_by(name: "Pink Party"), category: Category.find_by(name: "drinks"))
  EventCategory.create!(event: Event.find_by(name: "Pink Party"), category: Category.find_by(name: "festival"))
  EventCategory.create!(event: Event.find_by(name: "Just Drinks"), category: Category.find_by(name: "drinks"))
  EventCategory.create!(event: Event.find_by(name: "Dinner at Jerry's"), category: Category.find_by(name: "food"))
  EventCategory.create!(event: Event.find_by(name: "Dinner at Jerry's"), category: Category.find_by(name: "drinks"))
  EventCategory.create!(event: Event.find_by(name: "Summer festival"), category: Category.find_by(name: "festival"))
  EventCategory.create!(event: Event.find_by(name: "Summer festival"), category: Category.find_by(name: "outdoors"))
  EventCategory.create!(event: Event.find_by(name: "Beach Day"), category: Category.find_by(name: "outdoors"))
  EventCategory.create!(event: Event.find_by(name: "Ice Skating"), category: Category.find_by(name: "sports"))
  EventCategory.create!(event: Event.find_by(name: "Skiing"), category: Category.find_by(name: "sports"))
  EventCategory.create!(event: Event.find_by(name: "Skiing"), category: Category.find_by(name: "outdoors"))
  EventCategory.create!(event: Event.find_by(name: "Hot-Air Balloon"), category: Category.find_by(name: "other"))
  EventCategory.create!(event: Event.find_by(name: "Hot-Air Balloon"), category: Category.find_by(name: "outdoors"))
  EventCategory.create!(event: Event.find_by(name: "Surfing"), category: Category.find_by(name: "outdoors"))
  EventCategory.create!(event: Event.find_by(name: "Surfing"), category: Category.find_by(name: "sports"))
  EventCategory.create!(event: Event.find_by(name: "Downtown Fun"), category: Category.find_by(name: "drinks"))
  EventCategory.create!(event: Event.find_by(name: "Downtown Fun"), category: Category.find_by(name: "outdoors"))
  EventCategory.create!(event: Event.find_by(name: "Downtown Fun"), category: Category.find_by(name: "other"))
  EventCategory.create!(event: Event.find_by(name: "Pink Afterparty"), category: Category.find_by(name: "drinks"))
  EventCategory.create!(event: Event.find_by(name: "Pink Afterparty"), category: Category.find_by(name: "food"))
  EventCategory.create!(event: Event.find_by(name: "Electro Concert"), category: Category.find_by(name: "live music"))
  EventCategory.create!(event: Event.find_by(name: "Electro Concert"), category: Category.find_by(name: "drinks"))
  EventCategory.create!(event: Event.find_by(name: "Electro Concert"), category: Category.find_by(name: "outdoors"))
  EventCategory.create!(event: Event.find_by(name: "Theater Show"), category: Category.find_by(name: "theater"))
  EventCategory.create!(event: Event.find_by(name: "Open Mic Day"), category: Category.find_by(name: "live music"))
  EventCategory.create!(event: Event.find_by(name: "Open Mic Day"), category: Category.find_by(name: "drinks"))
  EventCategory.create!(event: Event.find_by(name: "Hike with Me"), category: Category.find_by(name: "sports"))
  EventCategory.create!(event: Event.find_by(name: "Hike with Me"), category: Category.find_by(name: "outdoors"))
  EventCategory.create!(event: Event.find_by(name: "Light Garden"), category: Category.find_by(name: "other"))
  EventCategory.create!(event: Event.find_by(name: "Light Garden"), category: Category.find_by(name: "outdoors"))
  EventCategory.create!(event: Event.find_by(name: "Theme Park"), category: Category.find_by(name: "outdoors"))
  EventCategory.create!(event: Event.find_by(name: "Theme Park"), category: Category.find_by(name: "other"))
end

def random_address(counter)
  addresses = [
  "1219 St. Laurent, Montreal, Québec, Canada",
  "104 Saint-Paul E., Montreal, Québec, Canada",
  "4101 Sherbrooke St E, Montreal, Québec, Canada",
  "4338 St Denis St, Montreal, Québec, Canada",
  "5200 Brebeuf St, Montreal, Québec, Canada",
  "7070 Henri Julien Ave, Montreal, Québec, Canada",
  "3800 Queen Mary Rd, Montreal, Québec, Canada",
  "138 Atwater Ave, Montreal, Québec, Canada",
  "859 Sherbrooke St W, Montreal, Québec, Canada",
  "3895 St Laurent Blvd, Montreal, Québec, Canada",
  "2098 Kimberley St, Montreal, Québec, Canada",
  "1499 Jeanne-Mance St, Montreal, Québec, Canada",
  "1594 St Denis St, Montreal, Québec, Canada",
  "1230 St Hubert St, Montreal, Québec, Canada",
  "1023 Ontario St E, Montreal, Québec, Canada",
  "3660 St Denis St, Montreal, Québec, Canada",
  "903 Lorimier Ave, Montreal, Québec, Canada",
  "1365 Ontario St E, Montreal, Québec, Canada",
  "4701 St Denis St, Montreal, Québec, Canada",
  "1603 Ontario St E, Montreal, Québec, Canada",
  "994 Rachel St E, Montreal, Québec, Canada",
  "536 Duluth Ave E, Montreal, Québec, Canada",
  "4408 St Denis St, Montreal, Québec, Canada",
  "4185 Drolet St, Montreal, Québec, Canada",
  "4801 St Laurent Blvd, Montreal, Québec, Canada",
  "4505 St Denis St, Montreal, Québec, Canada",
  "4265 Papineau Ave, Montreal, Québec, Canada",
  "1251 Gilford St, Montreal, Québec, Canada",
  "4710 Lanaudiere St, Montreal, Québec, Canada",
  "540 Boucher St, Montreal, Québec, Canada",
  "5035 St Denis St, Montreal, Québec, Canada"
  ]
  return addresses[counter]
end

# => Generate events

def generate_random_events
  Event.destroy_all
  puts ""
  puts "> Destroyed all events"
  puts "> Generating..."


  counter = 0
  while counter < 24 do
    User.all[0...4].each do |user|
      event = Event.new(user_id: user.id,
                        name: Faker::TvShows::Simpsons.location,
                        date_time: Faker::Time.between_dates(from: Date.today + 15, to: Date.today + 35, period: :day),
                        address: random_address(counter),
                        description: "Hey there, I am new in town and I don't know many people, would you like to join me in this activity? I am looking to meet all kinds of people!",
                        )
      attach_image(event, counter)
      event.save!
      if user.id == 4
        event.update(user_id: 5)
      end
      counter += 1
      assign_random_categories(Event.last)
    end
  end
end
def generate_specific_events
  counter = 0
  while counter < 24 do
    6.times do
      User.all[0...4].each do |user|
        event = Event.new(user_id: user.id,
                          name: event_name(counter),
                          date_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today + 14, period: :day),
                          address: random_address(counter),
                          description: "Hey there, I am new in town and I don't know many people, would you like to join me in this activity? I am looking to meet all kinds of people!",
                          )
        attach_image(event, counter)
        event.save!
        if counter < 10 && user.id == 4
          event.update(user_id: 5)
        end
        counter += 1
      end
    end
  end

  puts ""
  puts "> Gave first 4 users 12 events"
  puts "> Attached pictures to events"
  puts "> Attached categories to events"
  puts ""
end


# => Generate requests

def generate_requests
  Request.destroy_all
  puts ""
  puts "> Destroyed all requests"
  Request.new(user_id: 5,
              motivation: "Fancy meeting you here! :)",
              status: "Pending",
              event: Event.where(user_id: 1)[7]
              ).save!
  Request.new(user_id: 5,
              motivation: "Fancy meeting you here! :)",
              status: "Pending",
              event: Event.where(user_id: 2)[7]
              ).save!
  Request.new(user_id: 5,
              motivation: "Fancy meeting you here! :)",
              status: "Pending",
              event: Event.where(user_id: 3)[8]
              ).save!
  Request.new(user_id: 5,
              motivation: "Fancy meeting you here! :)",
              status: "Pending",
              event: Event.where(user_id: 4)[1]
              ).save!
  Request.new(user_id: 2,
              motivation: "Hii pick me please!",
              status: "Pending",
              event: Event.where(user_id: 4)[0]
              ).save!
  Request.new(user_id: 4, event: Event.where(user_id: 1)[6], status: "Accepted",
              motivation: "I love this activity! We will have a lot of fun, please pick me!").save!
  Request.new(user_id: 1, event: Event.where(user_id: 2)[6], status: "Accepted",
              motivation: "I love this activity! We will have a lot of fun, please pick me!").save!
  Request.new(user_id: 1, event: Event.where(user_id: 3)[6], status: "Accepted",
              motivation: "I love this activity! We will have a lot of fun, please pick me!").save!
  Request.new(user_id: 2, event: Event.where(user_id: 3)[7], status: "Accepted",
              motivation: "I love this activity! We will have a lot of fun, please pick me!").save!
  Request.new(user_id: 3, event: Event.where(user_id: 4)[0], status: "Accepted",
              motivation: "I love this activity! We will have a lot of fun, please pick me!").save!
  puts ""
  puts "> Generated requests"
  puts ""
end


  # Below = generate requests for all events
  # def generate_all_requests
  #   counter = 0
  #   4.times do
  #     counter += 1
  #     Event.all.each do |event|
  #       unless event.user_id == counter
  #         Request.new(user_id: counter,
  #                     motivation: ["I think we will have a fun time together! What do you say?", "I really really enjoy this activity and you seem like a nice person!", "I would love to join you! This sounds really fun!", "Thanks for considering me, I will be very happy if you pick me", "Hi I am a very nice person who loves outdoor activities and animals", "Fun!", "This is a great idea! We should totally do this together :)", "I loooove doing this! I will be very good company", "This sounds cool!", "I am very excited to do this, let's gooo! Choose me as your buddddy!", "You seem nice! I am also a traveller who doesn't know anyone here yet", "I love doing this, let's have fun", "Can we go tomorrow instead? If that's ok with you", "Hi I am just applying so I can chat with you haha", "Can we have drinks after too?", "Hey I would love to do this with you! Please message me so we can figure out the details", "I think we will have fun!","Cool idea","Hey we will have a great time if you choose me, promise!","If you don't choose me you will regret it","I think we will have a really fun time together!","Thanks for considering me!","Your activity sounds like a blast! So much fun!"].sample,
  #                     status: "Pending",
  #                     event: event
  #                     ).save!
  #       end
  #     end
  #   end
  # end



# => Generate messages

def generate_messages
  Message.destroy_all
  puts ""
  puts "> Destroyed all messages"
  # solene = User.first
  # daniela = User.second
  # celine = User.third
  # samantha = User.fourth
  # stephane = User.fifth
  Message.create(receiver: User.fourth, sender: User.first, content: "(Automated Message) - I picked you! Let's start planning :)")
  Message.create(receiver: User.first, sender: User.fourth, content: "Hi, nice to meet you")
  Message.create(receiver: User.fourth, sender: User.first, content: "We should do this again sometime :)")
  Message.create(receiver: User.first, sender: User.second, content: "(Automated Message) - I picked you! Let's start planning :)")
  Message.create(receiver: User.second, sender: User.first, content: "See you soon!")
  Message.create(receiver: User.second, sender: User.first, content: "I'm here, where are you?")
  Message.create(receiver: User.first, sender: User.second, content: "I see you")
  Message.create(receiver: User.second, sender: User.first, content: "Awesome! that was fun!")
  Message.create(receiver: User.first, sender: User.third, content: "(Automated Message) - I picked you! Let's start planning :)")
  Message.create(receiver: User.first, sender: User.third, content: "Hi there!")
  Message.create(receiver: User.third, sender: User.first, content: "Hello!")
  Message.create(receiver: User.second, sender: User.third, content: "(Automated Message) - I picked you! Let's start planning :)")
  Message.create(receiver: User.second, sender: User.third, content: "That was great, let's do it again sometime")
  Message.create(receiver: User.third, sender: User.fourth, content: "(Automated Message) - I picked you! Let's start planning :)")
  Message.create(receiver: User.fourth, sender: User.third, content: "Awesome! When do we meet?")
  Message.create(receiver: User.third, sender: User.fourth, content: "Soon!")
  Message.create(receiver: User.fourth, sender: User.third, content: "Sounds good!")
  Message.create(receiver: User.fifth, sender: User.third, content: "(Automated Message) - I picked you! Let's start planning :)")
  Message.create(receiver: User.third, sender: User.fifth, content: "I bet you didn't expect to see me!")
  Message.create(receiver: User.fifth, sender: User.fourth, content: "(Automated Message) - I picked you! Let's start planning :)")
  Message.create(receiver: User.fourth, sender: User.fifth, content: "I bet you didn't expect to see me!")
  Message.create(receiver: User.fifth, sender: User.first, content: "(Automated Message) - I picked you! Let's start planning :)")
  Message.create(receiver: User.first, sender: User.fifth, content: "I bet you didn't expect to see me!")
  Message.create(receiver: User.fifth, sender: User.second, content: "(Automated Message) - I picked you! Let's start planning :)")
  Message.create(receiver: User.second, sender: User.fifth, content: "I bet you didn't expect to see me!")

  # => Removed conversation between Samantha and Daniela for the demo:
  # Message.create(receiver: User.second, sender: User.fourth, content: "(Automated Message) - I picked you! Let's start planning :)")
  # Message.create(receiver: User.fourth, sender: User.second, content: "See you soon!")
  # Message.create(receiver: User.fourth, sender: User.second, content: "I'm here, where are you?")
  # Message.create(receiver: User.second, sender: User.fourth, content: "I see you")
  # Message.create(receiver: User.fourth, sender: User.second, content: "Awesome! that was fun!")

  puts ""
  puts "> Generated messages"
  puts ""
end

def generate_accepted_requests
  # solene = 1
  # daniela = 2
  # celine = 3
  # samantha = 4
  # stephane = 5
  Request.find_by(user_id: 4, event: Event.where(user_id: 1)[6]).update(status: "Accepted")
  Request.find_by(user_id: 1, event: Event.where(user_id: 2)[6]).update(status: "Accepted")
  Request.find_by(user_id: 1, event: Event.where(user_id: 3)[6]).update(status: "Accepted")
  Request.find_by(user_id: 5, event: Event.where(user_id: 1)[7]).update(status: "Accepted")
  Request.find_by(user_id: 5, event: Event.where(user_id: 2)[7]).update(status: "Accepted")
  Request.find_by(user_id: 2, event: Event.where(user_id: 3)[7]).update(status: "Accepted")
  Request.find_by(user_id: 3, event: Event.where(user_id: 4)[0]).update(status: "Accepted")
  Request.find_by(user_id: 5, event: Event.where(user_id: 3)[8]).update(status: "Accepted")
  Request.find_by(user_id: 5, event: Event.where(user_id: 4)[1]).update(status: "Accepted")

  # => Removed event between Samantha and Daniela for the demo:
  # Request.find_by(user_id: 2, event: Event.where(user_id: 4)[6]).update(status: "Accepted")

  puts ""
  puts "> Generated some accepted requests (to test inbox)"
  puts ""
end

generate_languages
generate_users
generate_categories
generate_random_events
generate_specific_events
fix_categories
generate_requests
generate_accepted_requests
generate_messages
