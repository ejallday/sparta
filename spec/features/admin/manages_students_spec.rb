require 'spec_helper'

feature 'Admin manages Students' do
  scenario 'by navigating to new Student page' do
    admin = create(:user, :admin)

    visit admin_dashboard_path(as: admin)

    click_link t('admin.dashboards.new_student')
    expect(current_path).to eq(new_admin_student_path)
  end

  scenario 'fill out new Student form' do
    admin = create(:user, :admin)

    visit new_admin_student_path(as: admin)
    fill_in 'First name', with: 'Timmy'
    fill_in 'Last name', with: 'Tebow'
    fill_in 'Email', with: 'timmyt4eva@example.com'
    fill_in 'Username', with: 'timmyt4eva'
    fill_in 'Password', with: 'password'
    click_button t('admin.students.create_student')
    student = Student.all.last

    expect(current_path).to eq(admin_student_path(student))
    expect(page).to have_content('First name: Timmy')
    expect(page).to have_content('Last name:  Tebow')
    expect(page).to have_content('Email: timmyt4eva@example.com')
    expect(page).to have_content('Username: timmyt4eva')
  end

  scenario 'views all students', js: true do
    admin = create(:user, :admin)
    create(:student, first_name: 'Jim', last_name: 'Jones')
    create(:student, first_name: 'Laura', last_name: 'Thompson')

    visit admin_students_path(as: admin)

    expect(page).to have_content('Jim Jones')
    expect(page).to have_content('Laura Thompson')
  end

  scenario 'filters students', js: true do
    admin = create(:user, :admin)
    create(:student, first_name: 'Jim', last_name: 'Jones')
    create(:student, first_name: 'Laura', last_name: 'Thompson')
    create(:student, first_name: 'Jim', last_name: 'Griffin')

    visit admin_students_path(as: admin)

    expect(page).to have_student_count(3)

    fill_in 'search', with: 'Jim'

    expect(page).to have_student_count(2)

    fill_in 'search', with: 'Thompson'

    expect(page).to have_student_count(1)
  end

  def have_student_count(count)
    have_css('tr.student-record', count: count)
  end
end
