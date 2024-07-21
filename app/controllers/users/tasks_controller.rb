class Users::TasksController < Users::ApplicationController
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
      redirect_to users_project_path(@project, show_task: 'true')
    else
      render 'new'
    end
  end

  def update
    @project = current_user.projects.find(params[:project_id])
    @task = current_user.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to users_project_path(@project)
    else
      render 'edit'
    end
  end

  # def show
  #   @project = current_user.projects.find(params[:id])
  #   @tasks = @project.tasks
  # end

  # def destroy
  #   @project = current_user.projects.find(params[:id])
  #   @project.destroy
  #   redirect_to users_projects_path, status: :see_other
  # end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
