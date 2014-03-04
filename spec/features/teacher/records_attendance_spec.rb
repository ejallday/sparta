require 'spec_helper'

feature 'Teacher records student behavior', js: true do
  let(:teacher) { create(:teacher) }
  let(:course) { create(:course, teacher: teacher) }

  scenario "by navigating to the roll call view" do
    timmy = create(:student, first_name: 'Timmy', last_name: 'Sanders')
    course.students = [timmy]

    visit teachers_course_path(course, as: teacher.user)
    click_link t('.teachers.courses.show.attendance')

    expect(current_path).to eq(teachers_course_attendance_path(course))
    expect(page).to have_content('Ts')
  end

  scenario 'by recording attendance for student' do
    timmy = create(:student, first_name: 'Timmy', last_name: 'Sanders')
    course.students = [timmy]

    visit teachers_course_attendance_path(course, as: teacher.user)
    expect(page).to have_css('.student-initials')
    take_attendance
    visit teachers_course_attendance_path(course, as: teacher.user)

    expect_student_to_have_attendance_status(course, 'present', 'Ts')

    click_student_icon_with_initials('Ts')
    take_attendance
    visit teachers_course_attendance_path(course, as: teacher.user)

    expect_student_to_have_attendance_status(course, 'absent', 'Ts')

    click_student_icon_with_initials('Ts')
    take_attendance
    visit teachers_course_attendance_path(course, as: teacher.user)

    expect_student_to_have_attendance_status(course, 'tardy', 'Ts')
  end


  def expect_student_to_have_attendance_status(course, status, initials)
    visit teachers_course_attendance_path(course)
    text = t('.course.attendances.index.student_initials', initials: initials)
    expect(page).to have_css(".#{status}", text: text)
  end

  def click_student_icon_with_initials(initials)
    text = t('.course.attendances.index.student_initials', initials: initials)
    find('li', text: text).click
  end

  def take_attendance
    click_button t('.teachers.roll_calls.edit.take_attendance')
    expect(page).to have_css('.behavior-list')
  end
end
