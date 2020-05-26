
# => Generate users

def generate_users
  # => Destroy all users
  ActiveRecord::Base.connection.execute("DELETE FROM users")
  puts "> Destroyed all users"
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
  puts "> Generated users: solene@email.com, daniela@email.com, celine@email.com, samantha@email.com"
  puts "> Attached profile pictures to users"
end



# => Seed order

generate_users
