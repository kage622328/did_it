class CompletedTasksController < ApplicationController
  def index
    @child = Child.find(params[:child_id])
    @completed_tasks = @child.completed_tasks
  end
end
