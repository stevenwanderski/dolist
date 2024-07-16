class Users::ProjectsController < Users::ApplicationController
  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      redirect_to users_projects_path
    else
      render 'new'
    end
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
