class Users::ApplicationController < ApplicationController
  layout 'users'
  before_action :authenticate_user!
end