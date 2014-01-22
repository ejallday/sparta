require 'spec_helper'

feature 'teacher adding an assignment' do
  scenario 'by navigating to new assignment page' do
    teacher = create(:user)
    visit teacher_dashboard_path(as: teacher)
    click_link I18n.t('helpers.new_model', model: 'Assignment')
    expect(current_path).to eq(new_teacher_assignment_path)
  end

  scenario 'can create an assignment with valid attributes' do
    teacher = create(:user)
    assignment_date = Date.parse('January 15, 2014')
    assignment_due = Date.parse('January 17, 2014')

    %w(Math Science History Quantum\ Physics).each do |course_name|
      create(:course, name: course_name)
    end
    visit new_teacher_assignment_path(as: teacher)
    select 'Science', from: :assignment_course_id
    fill_in :assignment_name, with: 'Pop Quiz'
    fill_in :assignment_description, with: 'test test test'
    select '2014', from: :assignment_assigned_on_1i
    select 'January', from: :assignment_assigned_on_2i
    select '15', from: :assignment_assigned_on_3i
    select '2014', from: :assignment_due_on_1i
    select 'January', from: :assignment_due_on_2i
    select '17', from: :assignment_due_on_3i
    fill_in :assignment_points_possible, with: 100
    click_button I18n.t('helpers.submit.create', model: 'Assignment')

    expect(current_path).to eq(teacher_assignments_path)
    expect(page).to have_content('course: Science')
    expect(page).to have_content('name: Pop Quiz')
    expect(page).to have_content('description: test test test')
    expect(page).to have_content("date assigned: #{I18n.l(assignment_date, format: :long)}")
    expect(page).to have_content("date due: #{I18n.l(assignment_due, format: :long)}")
    expect(page).to have_content('points possible: 100')
  end
end
