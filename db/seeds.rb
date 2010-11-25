puts "Generating 10 fake users"
10.times do
  User.create :fname => Faker::Name.first_name, :lname => Faker::Name.last_name, :email => Faker::Internet.email
  putc "."
end
puts "\nSuccessfully generated"
