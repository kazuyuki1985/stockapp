class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception
  def get_menu
    @projects = Project.all
    @notes = Note.all
  end
end