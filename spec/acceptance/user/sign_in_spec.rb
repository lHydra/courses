require_relative '../acceptance_helper.rb'

feature 'User sign in', %q{
  In order to be able view the courses
  As an User
  I want to be able sign in
} do

  given(:user) { create(:user) }

  scenario 'Registered user tries to sign in' do
    sign_in(user)

    expect(page).to have_content('Signed in successfully')
  end

  scenario 'Non-registered user tries to sign in' do
    visit new_user_session_path

    fill_in 'Email', with: 'wrong@email.ru'
    fill_in 'Password', with: 'wrong_password'
    click_on 'Log in'

    expect(page).to have_content('Invalid Email or password')
  end
end
