# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.connection.execute("DELETE FROM users")
puts "> destroyed all users"

# Generate users
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


celine = User.new(email: "celine@email.com",
         password: "123456",
         first_name: "Celine",
         last_name: "Rondeau",
         age: 27,
         bio: "My name is Celine and I'm pretty awesome!",
         living_in: "Montreal"
         )
celine.photo.attach(io: URI.open("https://res.cloudinary.com/dkbbawtjw/image/upload/v1590161759/celine.jpg"), filename: "celine.jpg", content_type: 'image/jpg')
celine.save


samantha = User.new(email: "samantha@email.com",
         password: "123456",
         first_name: "Samantha",
         last_name: "André",
         age: 37,
         bio: "My name is Samantha and I'm very pretty!",
         living_in: "Montreal"
         )
samantha.photo.attach(io: URI.open("https://res.cloudinary.com/dkbbawtjw/image/upload/v1590161980/samantha_tuybqx.jpg"), filename: "samantha.jpg", content_type: 'image/jpg')
samantha.save


puts "> generated users: solene@email.com, daniela@email.com, celine@email.com, samantha@email.com"
puts "> attached profile pictures to users"
