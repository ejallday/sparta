require 'spec_helper'

feature 'Teacher views teacher dashboard' do
  scenario 'by clicking on the dashboard link' do
    teacher = create(:teacher, last_name: 'Warbelow')
    visit sign_in_path
    fill_in 'session_email', with: teacher.email
    fill_in 'session_password', with: teacher.password
    click_button t('.helpers.submit.session.submit')

    expect(current_path).to eq(teachers_courses_path)

    click_link t('.layouts.teacher.dashboard')
    expect(current_path).to eq(teachers_dashboard_path)
    expect(page).to have_content('Warbelow')
  end
end
