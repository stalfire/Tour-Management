# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Database for user
User.create(name: "Regular Test", email: "regular@hotmail.com", password: "regular", role: 0)

user = {}
user['password'] = 'test'

ActiveRecord::Base.transaction do
  20.times do 
    user['name'] = Faker::Name.name
    user['email'] = Faker::Internet.email

    User.create(user)
  end
end 

# Seed Records
record = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    record['purpose'] = Faker::Space.galaxy
    record['description'] = Faker::Lorem.sentence(3)
    record['start_date'] = Faker::Date.backward(14)
    record['end_date'] = Faker::Date.forward(23)
    record['mode'] = ["Airplane", "Bus", "Train"].sample
    record['cost'] = rand(500..2000)
    record['home_city_price'] = rand(50..200)
    record['destination_city_price'] = rand(50..200)
    record['hotel_price'] = rand(300..1000)
    record['local_transport'] = ["Train", "Cab", "Bicycle", "Motorcycle", "Bus"].sample
    record['user_id'] = uids.sample
    Record.create(record)
  end
end

# Datebase for test user
User.create(name: "Manager Test", email: "manager1@hotmail.com", password: "manager", role: 1)
User.create(name: "Manager Test", email: "manager2@hotmail.com", password: "manager", role: 1)
User.create(name: "Manager Test", email: "manager3@hotmail.com", password: "manager", role: 1)
User.create(name: "Manager Test", email: "manager4@hotmail.com", password: "manager", role: 1)
User.create(name: "Manager Test", email: "manager5@hotmail.com", password: "manager", role: 1)
User.create(name: "Finance test", email: "finance@hotmail.com", password: "finance", role: 2)
User.create(name: "admin", email: "admin@hotmail.com", password: "admin", role: 0)
