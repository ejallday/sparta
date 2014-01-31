require 'spec_helper'

feature 'admin manages courses' do
  scenario 'by navigating to new course page' do
    admin = create(:user, :admin)

    visit admin_dashboard_path(as: admin)

    click_link t('helpers.new_model', model: 'Course')
    expect(current_path).to eq(new_admin_course_path)
  end

  scenario 'fill out new course form' do
    admin = create(:user, :admin)
    teacher = create(:teacher, first_name: 'Duce', last_name: 'Bigelow')

    visit new_admin_course_path(as: admin)
    fill_in :course_name, with: 'History'
    fill_in :course_period, with: '1'
    select teacher.full_name, from: :course_teacher_id
    click_button t('helpers.submit.create', model: 'Course')

    expect(current_path).to eq(admin_courses_path)
    expect(page).to have_content("History, period 1, instructor: #{teacher.last_name}")
  end

  scenario 'by navigating to course edit page' do
    admin = create(:user, :admin)
    teacher = create(:teacher)
    course = create(:course, teacher: teacher)
    visit admin_courses_path(as: admin)
    click_link t('helpers.edit_model', model: 'Course')

    expect(current_path).to eq(edit_admin_course_path(course))
  end

  scenario 'by changing course attributes' do
    admin = create(:user, :admin)
    teacher1 = create(:teacher, last_name: 'Bojangles')
    teacher2 = create(:teacher, last_name: 'Adams')
    course = create(:course, name: 'Math', period: '1', teacher: teacher1)

    visit edit_admin_course_path(course, as: admin)

    fill_in 'course_name', with: 'Physical Education'
    fill_in 'course_period', with: '5'
    select teacher2.full_name, from: :course_teacher_id
    click_button t('helpers.submit.update', model: 'Course')

    expect(current_path).to eq(admin_courses_path)
    expect(page).to have_content('Physical Education')
    expect(page).to have_content('period 5')
    expect(page).to have_content("instructor: #{teacher2.last_name}")
  end

  scenario 'by confirming delete before deleting a course' do
    admin = create(:user, :admin)
    course = create(:course)

    visit edit_admin_course_path(course, as: admin)
    delete_link = find_link(t('helpers.delete_model', model: 'Course'))
    confirmation_text = delete_link['data-confirm']

    expect(confirmation_text).to eq('Are you sure?')
  end

  scenario 'by deleting a course' do
    admin = create(:user, :admin)
    course = create(:course, name: 'History')

    visit edit_admin_course_path(course, as: admin)
    click_link t('admin.courses.form.delete')

    expect(current_path).to eq(admin_courses_path)
    expect(page).not_to have_content('History')
  end

  context 'when selecting a period for which Teachers are already booked' do
    scenario 'booked Teachers are not available as options', js: true do
      admin = create(:user, :admin)
      teacher1 = create(:teacher, first_name: 'Tom', last_name: 'Bojangles')
      teacher2 = create(:teacher, first_name: 'Quincy', last_name: 'Adams')
      create(:course, period: '1', teacher: teacher1)
      create(:course, period: '4', teacher: teacher2)

      visit new_admin_course_path(as: admin)
      expect(select_options_content).to include('Quincy Adams')
      expect(select_options_content).to include('Tom Bojangles')

      fill_in 'course_period', with: 1

      expect(select_options_content).to include('Quincy Adams')
      expect(select_options_content).not_to include('Tom Bojangles')

      fill_in 'course_period', with: 4

      expect(select_options_content).not_to include('Quincy Adams')
      expect(select_options_content).to include('Tom Bojangles')
    end
  end

  def select_options_content
    page.all('option').map(&:text)
  end
end
