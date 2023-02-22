class EntitiesController < ApplicationController
  before_action :authenticate_user!

  # GET /entities or /entities.json
  def index
    @entities = Entity.all
    @group = Group.includes(:entities).find(params[:group_id])
    @entities = @group.total_transactions
  end

  #def new
  @groups = Group.where(user: current_user)
  @entity = Entity.new
  respond_to do |format|
    format.html { render :new, locals: { entity: @entity } }
  end
end

  # POST /entities or /entities.json
  def create
    @entity = Entity.new(entity_params)

    respond_to do |format|
      format.html do
        if @entity.save
          redirect_to groups_path
        else
          flash.now[:error] = 'Error: Digidiktyn balasy'
          render :new, locals: { entity: @entity }
        end
      end
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id).merge(user: current_user)
  end
end
