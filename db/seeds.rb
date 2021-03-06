
User.create!(name:  "Sample User",
email: "Sample@example.org",
password:              "foobar",
password_confirmation: "foobar",
admin: true,
activated: true,
activated_at: Time.zone.now)

99.times do |n|
name = Faker::Name.name
email = "example-#{n+1}@example.org"
password = "password"
User.create!(name:   name, 
    email:  email,
    password:              password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
20.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.events.create!(content: content) }
end