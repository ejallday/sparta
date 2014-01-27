require 'spec_helper'

feature 'As a Teacher viewing Courses' do
  scenario 'I can only see my own courses' do
    teacher = create(:user, last_name: 'Navarre')
    create(:course, name: 'History', teacher: teacher)
    create(:course, name: 'Science')

    visit teacher_courses_path(as: teacher)

    expect(page).to have_content('History')
    expect(page).not_to have_content('Science')
  end

  pending 'with courses ordered by period'
end
