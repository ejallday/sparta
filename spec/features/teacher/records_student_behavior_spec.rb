require 'spec_helper'

feature 'Teacher records student behavior' do
  scenario "by navigating to the 'live course' view" do
    teacher = create(:teacher)
    course = create(:course, name: 'Angular JS', teacher: teacher)

    visit teachers_courses_path(as: teacher.user)
    click_link('Angular JS')

    expect(current_path).to eq(teachers_course_path(course))
  end

  scenario 'by sumbitting a behavior for student' do
    teacher = create(:teacher)
    course = create(:course, teacher: teacher)
    student = create(:student, first_name: 'Timmy', last_name: 'Sanders')
    course.students = [student]

    visit teachers_course_path(course, as: teacher.user)

    click_link t('.teachers.courses.show.student_initials', initials: 'Ts')

    expect(page).to have_content('Timmy Sanders')

    fill_in :student_action_name, with: 'Swearing'
    click_button t('.teachers.students.show.submit')

    expect(current_path).to eq(teachers_course_path(course))
    expect(page).to have_content('Swearing recorded for Timmy Sanders')
  end
end
