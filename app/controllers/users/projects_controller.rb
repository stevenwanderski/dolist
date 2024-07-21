class Users::ProjectsController < Users::ApplicationController
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
    @project = current_user.projects.find(params[:id])
    @tasks = @project.tasks.order(created_at: :asc)
    @show_task = params[:show_task] == 'true'
  end

  def destroy
    @project = current_user.projects.find(params[:id])
    @project.destroy
    redirect_to users_projects_path, status: :see_other
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
