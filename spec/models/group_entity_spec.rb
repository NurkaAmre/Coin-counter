require 'rails_helper'

RSpec.describe GroupEntity, type: :model do
  subject do
    User.create(name: 'Amre', email: 'amre@gmail.com', password: 'amre12')
  end

  before(:each) do
    @entity = Entity.new(name: 'Shoes', amount: 100, user_id: subject.id)
    @group = Group.new(name: 'Shoes',
                             icon: 'tufli.png',
                             user_id: subject.id)
    @group_entity = GroupEntity.new(entity: @entity, group: @group)
  end

  context 'Testing validations' do
    it 'Validation should be successful' do
      expect(@group_entity).to be_valid
    end
  end

  context 'Testing associations' do
    it 'GroupEntity should belong to an expense' do
      subject = GroupEntity.reflect_on_association(:entity)
      expect(subject.macro).to eq(:belongs_to)
    end

    it 'GroupEntity should belong to a category' do
      subject = GroupEntity.reflect_on_association(:group)
      expect(subject.macro).to eq(:belongs_to)
    end
  end
end