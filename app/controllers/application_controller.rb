class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception
  def getmenu
    @projects = Project.all
    @notes = Note.all
  end
end