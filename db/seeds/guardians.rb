say 'Creating 150 Guardians and Guardianships'

students = Student.all

students.each do |student|
  first_name = Faker::Name.first_name
  last_name = student.last_name
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
