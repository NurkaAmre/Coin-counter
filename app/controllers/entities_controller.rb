class EntitiesController < ApplicationController
  def new
    @entity = Entity.new
    @groups = Group.all
  end

  def create
    @group = Group.find(params[:group_id])
    @entity = Entity.new(entity_params)
    @entity.user = current_user
    return unless @entity.save

    redirect_to user_groups_path(current_user)
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id)
  end
end
