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
end
