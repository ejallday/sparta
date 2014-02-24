require 'spec_helper'

feature 'admin manages courses', js: true do
  scenario 'by navigating to new course page' do
    admin = create(:user, :admin)

    visit admin_dashboard_path(as: admin)

    click_link t('.layouts.admin.new_course')
    expect(current_path).to eq(new_admin_course_path)
  end

  scenario 'by navigating courses page' do
    admin = create(:user, :admin)

    visit admin_dashboard_path(as: admin)

    click_link t('.layouts.admin.courses')
    expect(current_path).to eq(admin_courses_path)
  end

  scenario 'by navigating guardians page' do
    admin = create(:user, :admin)

    visit admin_dashboard_path(as: admin)

    click_link t('.layouts.admin.guardians')
    expect(current_path).to eq(admin_guardians_path)
  end

<<<<<<< HEAD
=======
  scenario 'by navigating students page' do
    admin = create(:user, :admin)

    visit admin_dashboard_path(as: admin)

    click_link t('.layouts.admin.students')
    expect(current_path).to eq(admin_students_path)
  end

>>>>>>> 1485f59... Fix i18n Links for Admin layout
  scenario 'fill out new course form' do
    admin = create(:user, :admin)
    teacher = create(:teacher, first_name: 'Duce', last_name: 'Bigelow')

    visit new_admin_course_path(as: admin)
    fill_in :course_name, with: 'History'
    fill_in :course_period, with: '1'
    select teacher.full_name, from: :course_teacher_id
    click_button t('admin.courses.create_course')

    expect(current_path).to eq(admin_courses_path)
    expect(page).to have_content('History')
    expect(page).to have_content('Bigelow')
  end

  scenario 'by navigating to course edit page' do
    admin = create(:user, :admin)
    teacher = create(:teacher)
    course = create(:course, teacher: teacher)
    visit admin_courses_path(as: admin)
    click_link t('admin.courses.edit_course')

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
    click_button t('admin.courses.update_course')

    expect(current_path).to eq(admin_courses_path)
    expect(page).to have_content('Physical Education')
    expect(page).to have_content('5')
    expect(page).to have_content('Adams')
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
    click_link t('admin.courses.edit.delete')

    expect(current_path).to eq(admin_courses_path)
    expect(page).not_to have_content('History')
  end

  scenario 'views and filters courses with text search' do
    admin = create(:user, :admin)
    teacher1 = create(:teacher, last_name: 'Bojangles')
    teacher2 = create(:teacher, last_name: 'Adams')
    history = create(:course, name: 'History', period: '1', teacher: teacher1)
    science = create(:course, name: 'Science', period: '4', teacher: teacher2)
    english = create(:course, name: 'English', period: '5', teacher: teacher2)

    visit admin_courses_path(as: admin)

    expect(displayed_course_list).to eq([history, science, english])

    fill_in t('.admin.courses.index.search'), with: 'Sci'

    expect(displayed_course_list).to eq([science])
  end

  scenario 'views and filters courses with text search' do
    admin = create(:user, :admin)
    teacher1 = create(:teacher, last_name: 'Bojangles')
    teacher2 = create(:teacher, last_name: 'Adams')
    teacher3 = create(:teacher, last_name: 'Warbelow')
    teacher4 = create(:teacher, last_name: 'Allen')
    history1 = create(:course, name: 'History', period: '1', teacher: teacher1)
    history2 = create(:course, name: 'History', period: '2', teacher: teacher1)
    history4 = create(:course, name: 'History', period: '1', teacher: teacher4)
    science = create(:course, name: 'Science', period: '1', teacher: teacher2)
    english = create(:course, name: 'English', period: '1', teacher: teacher3)

    visit admin_courses_path(as: admin)

    expect(displayed_course_list).to match_array([history1, history2, history4,
                                                  science, english])
    select '1', from: t('.admin.courses.index.period')

    expect(displayed_course_list).to match_array([history1, science, english, history4])

    select 'History', from: t('.admin.courses.index.course')

    expect(displayed_course_list).to match_array([history1, history4])

    select 'Allen', from: t('.admin.courses.index.teacher')

    expect(displayed_course_list).to match_array([history4])
  end

  context 'when selecting a period for which Teachers are already booked' do
    scenario 'booked Teachers are not available as options' do
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

  def displayed_course_list
    Course.find(displayed_course_ids)
  end

  def displayed_course_ids
    page.all('.course-record').map do |el|
      el['data-course-id']
    end
  end
end
