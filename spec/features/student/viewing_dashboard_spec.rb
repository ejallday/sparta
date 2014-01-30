require 'spec_helper'

feature 'Student views student dashboard' do
  scenario 'by logging in as a student' do
    student = create(:student)
    visit sign_in_path
    within_form(:session) do |f|
      f.fill_in_text_fields(
        email: student.email,
        password: student.password
      )
      f.submit('session.submit')
    end

    expect(current_path).to eq(students_dashboard_path)
  end
end
