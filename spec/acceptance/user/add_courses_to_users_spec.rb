require_relative '../acceptance_helper.rb'

feature 'Add the courses to users', %q{
  In order to be able manage academic perfomance
  As an Admin
  I want to be able to add courses to students
} do

  given(:admin) { create(:admin) }
  given!(:student) { create(:student) }
  given!(:user) { create(:user) }
  given(:course) { create(:course) }

  scenario 'Admin can to add courses to students group' do
    sign_in(admin)

    visit edit_admin_course_path(course)

    select('student', from: 'groups')
    click_on 'Add course'

    expect(page).to have_content 'Course was successfully add!'
  end

  scenario 'Admin can to add courses to some user' do
    sign_in(admin)

    visit edit_admin_course_path(course)

    select(user.email, from: 'user')
    click_on 'Add course'

    expect(page).to have_content 'Course was successfully add!'
  end

  scenario 'Student can`t manage courses' do
    sign_in(student)

    visit edit_admin_course_path(course)

    expect(page).to have_content('Access Denied!')
  end

  scenario 'Guest can`t manage courses' do
    visit edit_admin_course_path(course)

    expect(page).to have_content('Access Denied!')
  end
end
