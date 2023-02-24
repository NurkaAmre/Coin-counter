require 'rails_helper'

RSpec.describe 'Home page', type: :feature do
  before :each do
    visit home_path
  end

  it 'I can see the button in splash screen' do
    expect(page).to have_link 'Sign In'
    expect(page).to have_link 'Sign Up'
  end

  it 'should be able to see login page' do
    click_on 'Sign In'
    expect(page).to have_current_path new_user_session_path
  end

  it 'should be able to see sign up page' do
    click_on 'Sign Up'
    expect(page).to have_current_path new_user_registration_path
  end
end
