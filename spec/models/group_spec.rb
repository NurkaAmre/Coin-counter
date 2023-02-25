require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.create(name: 'Amre', email: 'amre@gmail.com', password: 'amre12')
    @group = Group.new(user_id: @user.id, name: 'Fun', icon: 'mask.jpg')
  end

  context 'Testing Validations' do
    it 'is valid with valid attributes' do
      expect(@group).to be_valid
    end

    it 'is not valid without a name' do
      @group.name = nil
      expect(@group).to_not be_valid
    end

    it 'is not valid without an icon' do
      @group.icon = nil
      expect(@group).to_not be_valid
    end

    it 'is not valid without user id' do
      @group.user_id = nil
      expect(@group).to_not be_valid
    end
  end

  context 'Testing Associations' do
    it 'belongs_to User' do
      assoc = Group.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end

    it 'has_many group_expenses' do
      assoc = Group.reflect_on_association(:entities)
      expect(assoc.macro).to eq :has_many
    end
  end
end
