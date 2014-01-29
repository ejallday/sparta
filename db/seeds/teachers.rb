# Periods
periods = (1..7).to_a

# Subjects
subjects = %w(
  Math
  Science
  PhysEd
  History
  Art
  Music
  Biology
)

say 'Creating 5 Teacher records...'
5.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.create!(
    first_name: first_name,
    last_name: last_name,
    email: Faker::Internet.email,
    username: "#{first_name}#{last_name}".downcase,
    password: 'password'
  )
  teacher = Teacher.create!(user: user)

  say "Creating 5 courses for Teacher: #{teacher.email}..."
  available_periods = periods.dup.shuffle
  5.times do
    course = teacher.courses.create!(
      name: subjects.sample,
      period: available_periods.pop
    )
    say "Created Course #{course.name}, period: #{course.period}"
  end
end
