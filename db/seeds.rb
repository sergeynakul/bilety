User.create!(name:  "admin",
             email: "admin@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: true)
User.create!(name:  "employee1",
             email: "employee1@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: true)
User.create!(name:  "employee2",
             email: "employee2@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: true)
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password:             password,
               password_confirmation: password)
end