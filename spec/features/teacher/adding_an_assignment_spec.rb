require 'spec_helper'

feature 'teacher adding an assignment' do

  scenario 'by navigating to new assignment page' do
    teacher = create(:user)
    visit teachers_dashboard_path(as: teacher)
    click_link t('helpers.new_model', model: 'Assignment')
    expect(current_path).to eq(new_teachers_assignment_path)
  end

  scenario 'can create an assignment with valid attributes' do

    teacher = create(:user)

    %w(Math Science History Quantum\ Physics).each do |course_name|
      create(:course, name: course_name, teacher: teacher)
    end

    visit new_teachers_assignment_path(as: teacher)

    assigned_on = Date.parse('January 15, 2014')
    due_on = Date.parse('January 17, 2014')

    within_form(:assignment) do |f|
      f.select_from_dropdown(course_id: 'Science')
      f.fill_in_text_field(
        name: 'Pop Quiz',
        description: 'I hope you studied!',
        points_possible: 100
      )
      f.select_date(
        assigned_on: assigned_on,
        due_on: due_on
      )
      f.submit(:create)
    end

    expect(current_path).to eq(teachers_assignments_path)
    expect(page).to have_content("#{Assignment.human_attribute_name(:course)}: Science")
    expect(page).to have_content("#{Assignment.human_attribute_name(:name)}: Pop Quiz")
    expect(page).to have_content("#{Assignment.human_attribute_name(:description)}: I hope you studied!")
    expect(page).to have_content("#{Assignment.human_attribute_name(:assigned_on)}: #{l(assigned_on, format: :long)}")
    expect(page).to have_content("#{Assignment.human_attribute_name(:due_on)}: #{l(due_on, format: :long)}")
    expect(page).to have_content("#{Assignment.human_attribute_name(:points_possible)}: 100")
  end
end
