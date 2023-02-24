require 'rails_helper'

RSpec.feature 'Groups', type: :feature do
  before :each do
    @user = User.create(name: 'Amre', email: 'amre@gmail.com', password: 'amre12')
    @group = Group.create(user_id: @user, name: 'Food',
                             icon: 'kasha.jpg')

    visit root_path
    click_link 'Log In'

    within('#new_user') do
      fill_in 'email', with: 'amre@gmail.com'
      fill_in 'password', with: 'amre12'
    end
    click_button 'Log in'
  end

  it 'visits categories page' do
    expect(current_path).to match groups_path
    expect(page).to have_content 'Food'
  end

  it 'redirects to transactions page of the category' do
    within("#group_#{@group.id}") do
      click_on @group.name
    end
    expect(current_path).to match group_entities_path(@group)
  end
end