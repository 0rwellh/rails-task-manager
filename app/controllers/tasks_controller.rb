class TasksController < ApplicationController
  def index #nom de la méthode que tu devras appeler dans la vue (et lui donner son nom)
    @tasks = Task.all #tu cherches à récupérer TOUTES les valeurs de tasks
  end

  def show
    @task = Task.find(params[:id]) #avec cette méthode, lorsque tu l'appelles,
    #tu veux faire en sorte que @task soit là pour trouver un task avec les params id
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path, status: :see_other
  end

  private
  def task_params
    params.require(:task).permit(:title, :details)
  end
end
