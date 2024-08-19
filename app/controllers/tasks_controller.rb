class TasksController < ApplicationController
  after_action :increment_completed_task_count, if: :status_completed?

  def change_status
    @task = Task.find(params[:id])
    @task.completed! if @task.incomplete?
    
    redirect_to list_path(@task.list_id) and return
  end

  private

  def status_completed?
    @task.completed?
  end

  def increment_completed_task_count
    completed_task = CompletedTask.find_or_initialize_by(task_body: @task.body, child_id: @task.list.child.id)
    completed_task.completed_count += 1
    completed_task.save
  end
end
