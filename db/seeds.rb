puts "A apagar a base de dados..."

Review.destroy_all
Assignment.destroy_all
Request.destroy_all
User.destroy_all

puts "A criar 10 users e 10 pedidos"

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
    category: ["Compras", "Reparações", "Recados", "Saúde", "Cuidados", "Donativos", "Companhia", "Associação", "Animais", "Denúncia", "Outro"].sample,
    person_name: Faker::FunnyName.name,
    age: rand(20..95),
    address: Faker::Address.street_address,
    zip_code: "2735-356",
    city: Faker::Address.city,
    phone_number: Faker::PhoneNumber.cell_phone,
    user: user
  )
end

puts "A criar demo user"

  User.create!(
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
 Request.create!(
    title: 'Ajudar Dona Cremilde a ir às compras',
    description: Faker::Lorem.paragraph(sentence_count: 10),
    category: ["Compras", "Reparações", "Recados", "Saúde", "Cuidados", "Donativos", "Companhia", "Associação", "Animais", "Denúncia", "Outro"].sample,
    person_name: Faker::FunnyName.name,
    age: rand(20..95),
    address: 'Avenida da Liberdade, Lisboa',
    zip_code: "1500-281",
    city: Faker::Address.city,
    phone_number: Faker::PhoneNumber.cell_phone,
    user: User.all.sample
  )
