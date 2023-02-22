class EntitiesController < ApplicationController
  def new
    @entity = Entity.new
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
      @entity = Entity.new(entity_params)
      @entity.user = current_user
      @entity.group = @group

      if @entity.save
        redirect_to user_groups_path(current_user)
      end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end