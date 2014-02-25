students = Student.all
students.each do |student|
  courses = Course.all
  random_courses = courses.group_by(&:period).values.map(&:sample).shuffle.take(5)
  random_courses.each do |course|
    Enrollment.create!(student_id: student.id, course_id: course.id)
    say "Enrolled #{student.full_name} in Course #{course.name}"
  end
end

