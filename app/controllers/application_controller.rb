class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception
  def get_menu
    @projects = current_user.projects
    @notes = current_user.notes
  end
end