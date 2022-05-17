class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    if @task.completed
      @message = 'This task is completed'
    else
      @message = 'This task is not completed yet'
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

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    @task.completed = true if params[:task][:completed] == '1'
    @task.save
    redirect_to tasks_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
