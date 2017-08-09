
class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  # Mostra a descrição de uma task de tasks
  def show
    @task = Task.find(params[:id])
  end
  # pega as informações para criar uma task com create
  def new
    @task = Task.new
  end
  # cria uma nova task
  def create
    # @task = Task.new(params[:task])
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end
  # edita uma task exixtente
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    # @task.update(params[:task])
    @task.update(task_params)
    redirect_to tasks_path
  end
  # deleta uma task acionando um link
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end

end


