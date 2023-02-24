require 'rails_helper'

RSpec.describe 'Group page', type: :feature do
  before :each do
    @user1 = User.new(name: 'Amre', email: 'amre@gmail.com', password: 'amre12')
    @group = Group.create(user_id: @user1, name: 'Food',
        icon: 'food.png')
    @user1.save
    visit new_user_session_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log in'
  end

  it 'should be able to see categories' do
    expect(page).to have_content('Welcome to Categories')
  end

  it 'should be able to redirect to add new category' do
    click_button 'Add new category'
    expect(page).to have_current_path(new_user_group_path(@user1.id))
  end

  it 'It should display add new category button' do
    expect(page).to have_content('Add new category')
  end
end