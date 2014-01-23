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
      create(:course, name: course_name)
    end

    visit new_teacher_assignment_path(as: teacher)

    assigned_on = DateTime.parse('January 15, 2014')
    due_on = DateTime.parse('January 17, 2014')


    select 'Science', from: :assignment_course_id
    fill_in :assignment_name, with: 'Pop Quiz'
    fill_in :assignment_description, with: 'I hope you studied!'
    select_date( :assignment, :assigned_on, assigned_on )
    select_date( :assignment, :due_on, due_on )
    fill_in :assignment_points_possible, with: 100
    click_button I18n.t('helpers.submit.create', model: 'Assignment')

    expect(current_path).to eq(teacher_assignments_path)
    expect(page).to have_content('course: Science')
    expect(page).to have_content('name: Pop Quiz')
    expect(page).to have_content('description: I hope you studied!')
    expect(page).to have_content('assigned on: January 15, 2014')
    expect(page).to have_content('due on: January 17, 2014')
    expect(page).to have_content('points possible: 100')
  end



  def select_date(prefix, field, date)
    select date.year, from: :"#{prefix}_#{field}_1i"
    select date.strftime('%B'), from: :"#{prefix}_#{field}_2i"
    select date.day, from: :"#{prefix}_#{field}_3i"
  end
end
