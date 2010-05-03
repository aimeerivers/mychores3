class TasksController < ApplicationController
  before_filter :sign_in_required

  def new
    @task = Task.new
  end

  def create
    begin
      @task = current_user.assign(Task.new(params[:task]))
      flash[:notice] = 'Task created successfully.'
      redirect_to(task_path(@task))
    rescue
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end
end
