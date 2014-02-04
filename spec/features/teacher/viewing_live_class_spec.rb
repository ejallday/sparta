require 'spec_helper'

feature ' Teacher views live course view'do
  scenario 'by visiting Teacher course' do
    teacher = create(:teacher)
    course = create(:course, teacher: teacher)

    visit teachers_course_path(course, as: teacher.user)

    expect(current_path).to eq(teachers_course_path(course))
  end

  scenario 'by navigating to live course' do
    teacher = create(:teacher)
    course = create(:course, name: 'Science', teacher: teacher)

    visit teachers_dashboard_path(as: teacher.user)
    click_link('Science')

    expect(current_path).to eq(teachers_course_path(course))
  end

  scenario 'by viewing Students enrolled in course' do
    teacher = create(:teacher)
    course = create(:course, teacher: teacher)
    student1 = create(:student, first_name: 'Timmy', last_name: 'Tebow')
    course.students = [student1]

    visit teachers_course_path(course, as: teacher.user)

    expect(page).to have_content(student1.initials)
  end
end
