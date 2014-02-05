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
    fill_in :student_user_attributes_first_name, with: 'Timmy'
    fill_in :student_user_attributes_last_name, with: 'Tebow'
    fill_in :student_user_attributes_email, with: 'timmyt4eva@example.com'
    fill_in :student_user_attributes_username, with: 'timmyt4eva'
    fill_in :student_user_attributes_password, with: 'password'
    click_button t('admin.students.create_student')
    student = Student.all.last

    expect(current_path).to eq(admin_student_path(student))
    expect(page).to have_content("#{Student.human_attribute_name(:first_name)}: Timmy")
    expect(page).to have_content("#{Student.human_attribute_name(:last_name)}: Tebow")
    expect(page).to have_content("#{Student.human_attribute_name(:email)}: timmyt4eva@example.com")
    expect(page).to have_content("#{Student.human_attribute_name(:username)}: timmyt4eva")
  end
end
