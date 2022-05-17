class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])

    if @task.completed
      @message = 'This task is not completed yet'
    else
      @message = 'This task is completed'
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path(@task)
  end

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
