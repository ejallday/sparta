require 'spec_helper'

feature 'user editing a course' do
  scenario 'by navigating to course edit page' do
    teacher = create(:user)
    course = create(:course, teacher: teacher)
    visit teacher_courses_path(as: teacher)
    click_link I18n.t('helpers.edit_model', model: 'Course')

    expect(current_path).to eq(edit_teacher_course_path(course))
  end

  scenario 'by changing course attributes' do
    teacher1 = create(:user, last_name: 'Bojangles')
    teacher2 = create(:user, last_name: 'Adams')
    course = create(:course, name: 'Math', period: '1', teacher: teacher1)
    visit edit_teacher_course_path(course)
    fill_in 'course_name', with: 'Physical Education'
    fill_in 'course_period', with: '5'
    select teacher2.full_name, from: :course_user_id
    click_button I18n.t('helpers.submit.update', model: 'Course')

    expect(current_path).to eq(teacher_courses_path)
    expect(page).to have_content('Physical Education')
    expect(page).to have_content('period 5')
    expect(page).to have_content("instructor: #{teacher2.last_name}")
  end
end
