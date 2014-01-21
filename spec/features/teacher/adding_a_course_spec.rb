require 'spec_helper'

feature 'user adding a course' do
  scenario 'by navigating to new course page' do
    user = create(:user)
    visit teacher_dashboard_path(as: user)
    click_link I18n.t('teacher.dashboards.show.new_course')
    expect(current_path).to eq(new_teacher_course_path)
  end

  scenario 'fill out new course form' do
    teacher = create(:user)
    visit new_teacher_course_path(as: teacher)
    fill_in :course_name, with: 'History'
    fill_in :course_period, with: '1'
    select teacher.full_name, from: :course_user_id
    click_button I18n.t('teacher.courses.new.create_course')

    expect(current_path).to eq(teacher_courses_path)
    expect(page).to have_content("History, period 1, instructor: #{teacher.last_name}")
  end
end
