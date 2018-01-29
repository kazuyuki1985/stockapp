class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :user_logged_in?

  def user_logged_in?
    if session[:user_id]
      begin
        @current_user = User.find_by(user_id: session[:user_id])
      resscue ActiveRecord::RecordNotFound
        reset_user_session
      end
    end
    return if @current_user
    # @curremt_userが取得できなかった場合はログイン画面にリダイレクト
    flash[:referer] = request.fullpath
    redirect_to new_user_session_path
  end

  def reset_user_session
    session[:user_id] = nil
    @current_user = nil
  end

  def getmenu
    @projects = Project.all
    @notes = Note.all
  end
end