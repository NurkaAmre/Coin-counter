require 'rails_helper'

RSpec.describe Entity, type: :model do
  before :each do
    @user = User.create(name: 'Amre', email: 'amre@gmail.com', password: 'amre12')
    @entity = Entity.new(user_id: @user.id, name: 'Hamburger', amount: 12.99)
  end

  context 'Testing Validations' do
    it 'is not valid without a name' do
      @entity.name = nil
      expect(@entity).to_not be_valid
    end

    it 'is not valid without an icon' do
      @entity.amount = nil
      expect(@entity).to_not be_valid
    end

    it 'has amount, which is numeric data type' do
      expect(@entity.amount).to be_kind_of Numeric
    end

    it 'is not valid without user id' do
      @entity.user_id = nil
      expect(@entity).to_not be_valid
    end
  end

  context 'Testing Associations' do
    it 'belongs_to User' do
      assoc = Entity.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end

    it 'has_many group_entities' do
      assoc = Entity.reflect_on_association(:group_entities)
      expect(assoc.macro).to eq :has_many
    end
  end
end
