class Users::ApplicationController < ApplicationController
  layout 'users'
  before_action :authenticate_user!
  before_action :set_projects

  private

  def set_projects
    @projects = current_user.projects
  end
end