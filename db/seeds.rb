#Create user admin
User.create!(name: "Example User",
             email: "example@railstutorial.org",
             phone: "0905278872",
             address: "123 Main Street",
             password: "abcAbc123@",
             password_confirmation: "abcAbc123@",
             role: 1)

30.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  phone = Faker::PhoneNumber.phone_number
  address = Faker::Address.street_address
  password = "abcAbc123-"
  User.create!(name: name,
               email: email,
               phone: phone,
               address: address,
               password: password,
               password_confirmation: password,
               role: 0)
end
for n in 1..30
  Pitch.create!(name: Faker::Sports::Football.team,
                pitch_type: 5,
                rate: 3,
                hour_price: 200000)
end
