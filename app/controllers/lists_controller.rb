class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]
  before_action :set_child, only: %i[show edit update destroy]

  def new
    @list = List.new
    @child = Child.find_by(id: params[:child_id])
    4.times { @list.tasks.build}
  end

  def create
    @child = Child.find_by(id: params[:child_id])
    @list = @child.lists.build(list_params)

    if @list.save
      redirect_to child_path(@child)
    else
      tasks_attributes = params[:list][:tasks_attributes].to_unsafe_h
      empty_bodies_count = tasks_attributes.select { |_, task| task[:body].empty? }.size
      empty_bodies_count.times {@list.tasks.build}
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @tasks = @list.tasks.order(id: :asc)
  end

  def edit
    (4 - @list.tasks.count).times do
      @list.tasks.build
    end
  end

  def update
    # tasks_attributesからbodyが空のタスクを削除する
    params[:list][:tasks_attributes].each do |key, task_params|
      if task_params[:body].blank?
        task_params[:_destroy] = '1' 
      end
    end

    if @list.update(list_params)
      redirect_to list_path(@list), success: "成功したよ"
    else
      flash.now[:danger] = "失敗したよ"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to child_path(@child), status: :see_other
  end

  private

  def set_child
    @child = @list.child
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, tasks_attributes: [:id, :body, :_destroy])
  end
end
