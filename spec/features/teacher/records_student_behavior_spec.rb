require 'spec_helper'

feature 'Teacher records student behavior', js: true do
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
    click_student_initials('Ts')
    fill_in :student_action_name, with: 'Swearing'
    click_on t('.teachers.courses.show.record_action')

    expect(page).to have_content('Swearing recorded for Timmy Sanders')
  end

  scenario 'button is disabled until all data is filled in' do
    teacher = create(:teacher)
    course = create(:course, teacher: teacher)
    course.students += [create(:student, first_name: 'Timmy', last_name: 'Sanders')]

    visit teachers_course_path(course, as: teacher.user)

    expect(page).to have_css('button[disabled]')

    click_student_initials('Ts')

    expect(page).to have_css('button[disabled]')

    fill_in :student_action_name, with: 'Anything'

    expect(page).not_to have_css('button[disabled]')

    click_student_initials('Ts')

    expect(page).to have_css('button[disabled]')
  end

  scenario 'sees student as selected' do
    teacher = create(:teacher)
    course = create(:course, teacher: teacher)
    course.students += [create(:student, first_name: 'Timmy', last_name: 'Sanders')]
    course.students += [create(:student, first_name: 'Sunny', last_name: 'Smiles')]

    visit teachers_course_path(course, as: teacher.user)
    click_student_initials('Ts')

    expect(page).to have_css('.active', text: 'Ts')
    expect(page).not_to have_css('.active', text: 'Ss')

    click_student_initials('Ss')

    expect(page).not_to have_css('.active', text: 'Ts')
    expect(page).to have_css('.active', text: 'Ss')
  end

  def click_student_initials(initials)
    text = t('.teachers.courses.show.student_initials', initials: initials)
    find('li', text: text).click
  end
end
