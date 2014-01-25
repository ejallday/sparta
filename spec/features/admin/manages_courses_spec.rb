require 'spec_helper'

feature 'admin manages courses' do
  delegate :t, :l, to: I18n

  scenario 'by navigating to new course page' do
    admin = create(:user, :admin)

    visit admin_dashboard_path(as: admin)

    click_link t('helpers.new_model', model: 'Course')
    expect(current_path).to eq(new_admin_course_path)
  end

  scenario 'fill out new course form' do
    admin = create(:user, :admin)
    teacher = create(:user, first_name: 'Duce', last_name: 'Bigelow')
    
    visit new_admin_course_path(as: admin)
    fill_in :course_name, with: 'History'
    fill_in :course_period, with: '1'
    select teacher.full_name, from: :course_user_id
    click_button I18n.t('helpers.submit.create', model: 'Course')

    expect(current_path).to eq(admin_courses_path)
    expect(page).to have_content("History, period 1, instructor: #{teacher.last_name}")
  end

  scenario 'by navigating to course edit page' do
    admin = create(:user, :admin)
    teacher = create(:user)
    course = create(:course, teacher: teacher)
    visit admin_courses_path(as: admin)
    click_link t('helpers.edit_model', model: 'Course')

    expect(current_path).to eq(edit_admin_course_path(course))
  end

  scenario 'by changing course attributes' do
    admin = create(:user, :admin)
    teacher1 = create(:user, last_name: 'Bojangles')
    teacher2 = create(:user, last_name: 'Adams')
    course = create(:course, name: 'Math', period: '1', teacher: teacher1)

    visit edit_admin_course_path(course, as: admin)

    fill_in 'course_name', with: 'Physical Education'
    fill_in 'course_period', with: '5'
    select teacher2.full_name, from: :course_user_id
    click_button I18n.t('helpers.submit.update', model: 'Course')

    expect(current_path).to eq(admin_courses_path)
    expect(page).to have_content('Physical Education')
    expect(page).to have_content('period 5')
    expect(page).to have_content("instructor: #{teacher2.last_name}")
  end
end
