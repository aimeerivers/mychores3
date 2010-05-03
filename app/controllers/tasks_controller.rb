class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    if @task.save
      flash[:notice] = 'Task created successfully.'
      redirect_to(task_path(@task))
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end
end
