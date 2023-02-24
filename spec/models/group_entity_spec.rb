require 'rails_helper'

RSpec.describe GroupEntity, type: :model do
  before :each do
    @user = User.create(name: 'Amre', email: 'amre@gmail.com', password: 'amre12')
    @group = Group.create(user_id: @user, name: 'Toys', icon: 'toys.jpg')
    @entity = Entity.create(user_id: @user, name: 'Tobot cars', amount: 49.99)
    @group_entity = GroupEntity.new(groups_id: @group, entities_id: @entity)
  end

  context 'Testing Validations' do
    it 'is valid without a group_id' do
      @group_entity.groups_id = nil
      expect(@group_entity).to_not be_valid
    end

    it 'is valid without an expense_id' do
      @group_entity.entities_id = nil
      expect(@group_entity).to_not be_valid
    end
  end

  context 'Testing Associations' do
    it 'belongs_to recipe' do
      assoc = GroupEntity.reflect_on_association(:group)
      expect(assoc.macro).to eq :belongs_to
    end

    it 'belongs_to food' do
      assoc = GroupEntity.reflect_on_association(:entity)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end