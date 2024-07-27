class Users::ProjectsController < Users::ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update_weight]

  def index
  end

  def new
    @project = Project.new
  end

  def edit
    @project = current_user.projects.find(params[:id])
  end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      redirect_to users_projects_path
    else
      render 'new'
    end
  end

  def update
    @project = current_user.projects.find(params[:id])

    if @project.update(project_params)
      redirect_to users_projects_path
    else
      render 'edit'
    end
  end

  def show
    @show_task = params[:show_task] == 'true'
    @project = current_user.projects.find(params[:id])
    @tasks = @project.active_tasks
  end

  def destroy
    @project = current_user.projects.find(params[:id])
    @project.destroy
    redirect_to users_projects_path, status: :see_other
  end

  def update_weight
    @project = current_user.projects.find(params[:id])
    @project.update!(weight: params[:weight])
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
