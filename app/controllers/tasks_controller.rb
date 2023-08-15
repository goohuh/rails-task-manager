class TasksController < ApplicationController
  before_action :set_tasks, only: %i[show edit update destroy]

  def set_tasks
    @task = Task.find(params[:id])
  end

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path(@task) # task == task.id
  end

  def edit
  end

  def update
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
