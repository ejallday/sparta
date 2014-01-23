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

    %w(Math Science History Quantum\ Physics).each do |course_name|
      create(:course, name: course_name, teacher: teacher)
    end

    visit new_teacher_assignment_path(as: teacher)

    assigned_on = DateTime.parse('January 15, 2014')
    due_on = DateTime.parse('January 17, 2014')

    within_form(:assignment) do |prefix|
      select_from_dropdown(prefix, :course_id, 'Science')
      fill_in_text_field(prefix, :name, 'Pop Quiz')
      fill_in_text_field(prefix, :description, 'I hope you studied!')
      select_date(prefix, :assigned_on, assigned_on )
      select_date(prefix, :due_on, due_on )
      fill_in_text_field(prefix, :points_possible, 100)
      click_button I18n.t('helpers.submit.create', model: 'Assignment')
    end

    expect(current_path).to eq(teacher_assignments_path)
    expect(page).to have_content('course: Science')
    expect(page).to have_content('name: Pop Quiz')
    expect(page).to have_content('description: I hope you studied!')
    expect(page).to have_content('assigned on: January 15, 2014')
    expect(page).to have_content('due on: January 17, 2014')
    expect(page).to have_content('points possible: 100')
  end

  def within_form(prefix, &block)
    yield prefix
  end

  def fill_in_text_field(prefix, field, value)
    fill_in :"#{prefix}_#{field}", with: value  
  end

  def select_date(prefix, field, date)
    select date.year, from: :"#{prefix}_#{field}_1i"
    select date.strftime('%B'), from: :"#{prefix}_#{field}_2i"
    select date.day, from: :"#{prefix}_#{field}_3i"
  end

  def select_from_dropdown(prefix, field, value)
    select value, from: :"#{prefix}_#{field}"
  end
end
