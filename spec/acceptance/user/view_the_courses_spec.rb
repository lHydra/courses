require_relative '../acceptance_helper.rb'

feature 'View the courses', %q{
  In order to be able learning
  As an User
  I want to be able view the courses
} do

  given(:admin) { create(:admin) }
  given(:student) { create(:student) }
  given(:course_non_graduated) { create(:course) }
  given(:course_graduated) { create(:course, user_ids: student.id) }

  scenario 'Admin can view any courses' do
    sign_in(admin)

    visit course_path(course_non_graduated)
    expect(page).to have_content('Some description')
  end

  scenario 'Student can view graduated courses' do
    sign_in(student)

    visit course_path(course_graduated)
    expect(page).to have_content('Some description')
  end

  scenario 'Student can`t view non-graduated courses' do
    sign_in(student)

    visit course_path(course_non_graduated)
    expect(page).to have_content('Access Denied!')
  end

  scenario 'Guest can`t view the courses' do
    visit course_path(course_non_graduated)
    expect(page).to have_content('Access Denied!')
  end
end
