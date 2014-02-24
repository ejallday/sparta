say 'Creating 10 Student, Guardian and Guardianship records...'
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
  student = Student.create!(user: user)

  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.create!(
    first_name: first_name,
    last_name: last_name,
    email: Faker::Internet.email,
    username: "#{first_name}#{last_name}".downcase,
    password: 'password'
  )
  guardian = Guardian.create!(user: user)

  Guardianship.create!(student: student, guardian: guardian)
end
