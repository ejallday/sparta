require 'spec_helper'

feature 'Teacher records student behavior', js: true do
  let(:teacher) { create(:teacher) }
  let(:course) { create(:course, teacher: teacher) }

  scenario "by navigating to the 'live course' view" do
    course = create(:course, name: 'Angular JS', teacher: teacher)

    visit teachers_courses_path(as: teacher.user)
    click_link('Angular JS')

    expect(current_path).to eq(teachers_course_path(course))
  end

  scenario 'by sumbitting a behavior for student' do
    timmy = create(:student, first_name: 'Timmy', last_name: 'Sanders')
    course.students = [timmy]

    visit teachers_course_path(course, as: teacher.user)
    click_student_initials('Ts')
    find('button', text: 'Quality Work').click

    expect_student_to_have_behavior(timmy, 'Quality Work')
  end

  scenario 'button is disabled until all data is filled in' do
    course.students += [create(:student, first_name: 'Timmy', last_name: 'Sanders')]

    visit teachers_course_path(course, as: teacher.user)

    expect(page).to have_css('button[disabled]')

    click_student_initials('Ts')

    expect(page).not_to have_css('button[disabled]')

    click_student_initials('Ts')

    expect(page).to have_css('button[disabled]')
  end

  scenario 'sees student as selected' do
    course.students += [create(:student, first_name: 'Timmy', last_name: 'Sanders')]
    course.students += [create(:student, first_name: 'Sunny', last_name: 'Smiles')]

    visit teachers_course_path(course, as: teacher.user)
    click_student_initials('Ts')

    expect(page).to have_css('.active', text: 'Ts')
    expect(page).not_to have_css('.active', text: 'Ss')

    click_student_initials('Ss')

    expect(page).to have_css('.active', text: 'Ts')
    expect(page).to have_css('.active', text: 'Ss')
  end

  scenario 'submits action for multpile students' do
    timmy = create(:student, first_name: 'Timmy', last_name: 'Sanders')
    sunny = create(:student, first_name: 'Sunny', last_name: 'Smiles')
    jim = create(:student, first_name: 'Jim',   last_name: 'James')
    course.students += [timmy, sunny, jim]

    visit teachers_course_path(course, as: teacher.user)
    click_student_initials('Ts')
    click_student_initials('Jj')

    find('button', text: 'Quality Work').click

    expect(page).to have_content('Quality Work recorded')

    expect_student_to_have_behavior(timmy, 'Quality Work')
    expect_student_to_have_behavior(jim, 'Quality Work')
    expect_student_not_to_have_behavior(sunny, 'Quality Work')
  end

  def click_student_initials(initials)
    text = t('.teachers.courses.show.student_initials', initials: initials)
    find('li', text: text).click
  end

  def view_student_behaviors(student)
    visit course_student_actions_path(course)
    select student.full_name, from: :student_filter
  end

  def expect_student_to_have_behavior(student, behavior)
    view_student_behaviors(student)
    expect(page).to have_content(behavior)
  end

  def expect_student_not_to_have_behavior(student, behavior)
    view_student_behaviors(student)
    expect(page).not_to have_content(behavior)
  end
end
