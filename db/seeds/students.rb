say 'Creating 10 Student records...'
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.create!(
    first_name: first_name,
    last_name: last_name,
    email: Faker::Internet.email,
    username: "#{first_name}#{last_name}".downcase,
    password: 'password'
  )
  Student.create!(user: user)
end
