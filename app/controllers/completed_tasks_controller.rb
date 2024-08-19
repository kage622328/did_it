class CompletedTasksController < ApplicationController
  def index
    @child = Child.find(params[:child_id])
  end
   
end
