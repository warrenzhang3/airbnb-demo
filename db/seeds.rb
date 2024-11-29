# db/seeds.rb
puts "Cleaning database..."
User.destroy_all
Dog.destroy_all
Booking.destroy_all

# Creating users
user1 = User.create!(
  email: "user1@example.com",
  password: "password123",
  first_name: "Alice",
  last_name: "Doe"
)

user2 = User.create!(
  email: "user2@example.com",
  password: "password123",
  first_name: "Bob",
  last_name: "Smith"
)

# Creating dogs with image URLs
dog1 = Dog.create!(
  name: "Rex",
  description: "Un chien énergique et joueur.",
  address: "123 rue de la Paix, Paris",
  price: 20.0,
  city: "Paris",
  user: user1,
  image_url: "https://www.rd.com/wp-content/uploads/2020/11/GettyImages-758586901-scaled-e1606773458129.jpg?fit=696%2C464"
)

dog2 = Dog.create!(
  name: "Bella",
  description: "Chienne calme et affectueuse.",
  address: "456 avenue des Champs, Paris",
  price: 25.0,
  city: "Paris",
  user: user2,
  image_url: "https://hips.hearstapps.com/hmg-prod/images/movie-star-poodle-striking-a-pose-royalty-free-image-1676473807.jpg"
)

dog3 = Dog.create!(
  name: "Max",
  description: "Un chien actif, aime courir et jouer.",
  address: "789 boulevard St-Germain, Paris",
  price: 30.0,
  city: "Paris",
  user: user1,
  image_url: "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1qPi9I.img?w=800&h=415&q=60&m=2&f=jpg"
)

# Creating bookings
Booking.create!(
  start_date: Date.new(2024, 12, 1),
  end_date: Date.new(2024, 12, 5),
  total_price: 100.0,
  user: user2,
  dog: dog1
)

Booking.create!(
  start_date: Date.new(2024, 12, 10),
  end_date: Date.new(2024, 12, 15),
  total_price: 125.0,
  user: user1,
  dog: dog2
)

Booking.create!(
  start_date: Date.new(2024, 12, 5),
  end_date: Date.new(2024, 12, 7),
  total_price: 60.0,
  user: user2,
  dog: dog3
)

puts "Seed data created!"
puts "Users: #{User.count}"
puts "Dogs: #{Dog.count}"
puts "Bookings: #{Booking.count}"
