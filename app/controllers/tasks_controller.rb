class TasksController < ApplicationController

  def change_status   
    @task = Task.find(params[:id])
    @task.completed! if @task.incomplete?
    
    redirect_to list_path(@task.list_id)
  end
end
