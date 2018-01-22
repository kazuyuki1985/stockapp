class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :getmenu
  def getmenu
    @projects = Project.all
    @notes = Note.all
  end
end