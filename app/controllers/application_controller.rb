class ApplicationController < ActionController::Base
  private

  def after_sign_in_path_for(resource)
    users_projects_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
