require 'spec_helper'

feature 'As a Teacher viewing Courses' do
  scenario 'I can only see my own courses' do
    teacher = create(:teacher)
    create(:course, name: 'History', teacher: teacher)
    create(:course, name: 'Science')

    visit teachers_courses_path(as: teacher.user)

    expect(page).to have_content('History')
    expect(page).not_to have_content('Science')
  end

  scenario 'with courses ordered by period' do
    teacher = create(:teacher)
    create(:course, name: 'PE', period: 3, teacher: teacher)
    create(:course, name: 'History', period: 2, teacher: teacher)
    create(:course, name: 'Science', period: 5, teacher: teacher)

    visit teachers_courses_path(as: teacher.user)

    expect_courses_to_appear_in_the_following_order(%w(History PE Science))
  end

  def expect_courses_to_appear_in_the_following_order(course_names)
    course_elements = page.all('.course')
    expect(course_elements.map(&:text)).to eq(course_names)
  end
end
