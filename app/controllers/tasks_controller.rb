class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @task.update(tasks_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def tasks_params
    params.require(:task).permit(:title, :description)
  end
end
