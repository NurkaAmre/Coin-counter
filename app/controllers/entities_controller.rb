class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[edit update destroy]
  before_action :set_group, only: %i[index new edit create update destroy]
  before_action :set_user, only: %i[index edit create update destroy]
  # GET /expenses or /expenses.json
  def index
    @entities = @group.entities.order(created_at: :desc)
  end

  # GET group/expenses/new
  def new
    @entity = Entity.new
  end

  # GET group/expenses/1/edit
  def edit; end

  # POST group/expenses
  def create
    @entity = Entity.new(author: @users, **entity_params)
    if @entity.save
      @group_entity = GroupExpense.create(group: @group, entity: @entity)
      redirect_to group_entity_url(@group), notice: 'Expense was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT group/expenses/1
  def update
    if @entity.update(entity_params)
      redirect_to group_entity_url, notice: 'Expense was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE group/expenses/1
  def destroy
    @entity.destroy
    redirect_to group_entity_url(@group), notice: 'Expense was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end

  def set_group
    @group = set_user.groups.find(params[:group_id])
  end

  def set_entity
    @entity = set_user.entities.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end