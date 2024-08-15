class ListsController < ApplicationController
  before_action :set_child, only: %i[new create destroy]
  before_action :set_list, only: [:destroy]

  def new
    @list = List.new
    4.times { @list.tasks.build}
  end

  def create
    @list = @child.lists.build(list_params)

    if @list.save
      redirect_to child_path(@child)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to child_path(@child), status: :see_other
  end

  private

  def set_child
    @child = Child.find(params[:child_id]) 
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, tasks_attributes: [:body])
  end
end
