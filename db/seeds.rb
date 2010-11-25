puts "Generating 20 fake users"
20.times do
  User.create :fname => Faker::Name.first_name, :lname => Faker::Name.last_name, :email => Faker::Internet.email
  putc "."
end
puts "\nSuccessfully generated"
