class Users::TasksController < Users::ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update_weight]

  def new
    @project = current_user.projects.find(params[:project_id])
    @task = Task.new
  end

  def edit
    @project = current_user.projects.find(params[:project_id])
    @task = current_user.tasks.find(params[:id])
  end

  def create
    @project = current_user.projects.find(params[:project_id])
    @task = current_user.tasks.new(task_params)
    @task.project_id = @project.id

    if @task.save
      @tasks = @project.active_tasks
      @new_task = Task.new
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    @project = current_user.projects.find(params[:project_id])
    @task = current_user.tasks.find(params[:id])

    if @task.update(task_params)
      @tasks = @project.active_tasks
      @new_task = Task.new
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @project = current_user.projects.find(params[:project_id])
    @tasks = @project.active_tasks
    @task = current_user.tasks.find(params[:id])
    @task.destroy
  end

  def complete
    @project = current_user.projects.find(params[:project_id])
    @tasks = @project.active_tasks
    @task = current_user.tasks.find(params[:id])
    @task.update!(is_completed: true)
  end

  def update_weight
    @project = current_user.projects.find(params[:project_id])
    @task = current_user.tasks.find(params[:id])
    @task.update!(weight: params[:weight])
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
