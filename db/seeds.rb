puts "Destroying the DB!"

Review.destroy_all
Assignment.destroy_all
Request.destroy_all
User.destroy_all
Volunteer.destroy_all


puts "Creating 10 users & 10 requests"

10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: 123456,
    first_name: Faker::FunnyName.name,
    last_name: Faker::FunnyName.name,
    birth_date: Date.today,
    address: Faker::Address.street_address,
    zip_code: "2735-356",
    city: Faker::Address.city,
    about_me: Faker::Lorem.paragraph
  )
puts 'Created 1 user...'

  request = Request.create!(
    title: Faker::Verb.base,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: ["Reparações", "Recados", "Saúde", "Cuidados", "Donativos", "Companhia", "Associação", "Animais", "Denúncia", "Outro"].sample,
    person_name: Faker::FunnyName.name,
    age: rand(20..95),
    address: Faker::Address.street_address,
    zip_code: "2735-356",
    city: Faker::Address.city,
    phone_number: Faker::PhoneNumber.cell_phone,
    user: user
  )

  volunteer = Volunteer.create!(request: request)
  chatroom = Chatroom.create!(request: request, name: "#{request.title}")
end

puts "Creating 20 assignments"

  20.times do
    Assignment.create!(request: Request.all.sample, asker: User.all.sample)
  end

puts "Creating demo user"

  demo = User.create!(
    email: 'demo@demo.pt',
    password: 123456,
    first_name: Faker::FunnyName.name,
    last_name: Faker::FunnyName.name,
    birth_date: Date.today,
    address: Faker::Address.street_address,
    zip_code: "2735-356",
    city: Faker::Address.city,
    about_me: Faker::Lorem.paragraph
  )

puts "Creating demo request"

  demo_request = Request.create!(
    title: 'Ajudar Dona Cremilde a ir às compras',
    description: Faker::Lorem.paragraph(sentence_count: 10),
    category: ["Reparações", "Recados", "Saúde", "Cuidados", "Donativos", "Companhia", "Associação", "Animais", "Denúncia", "Outro"].sample,
    person_name: Faker::FunnyName.name,
    age: rand(20..95),
    address: 'Avenida da Liberdade, Lisboa',
    zip_code: "1500-281",
    city: Faker::Address.city,
    phone_number: Faker::PhoneNumber.cell_phone,
    user: demo
  )

puts "Creating 5 assignments for demo request"
  5.times do
    Assignment.create!(request: demo_request, asker: User.all.sample)
  end

  volunteer_demo = Volunteer.create!(request: demo_request)
  chatroom_demo = Chatroom.create!(request: demo_request, name: "#{demo_request.title}")


