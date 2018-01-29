class UsersController < ApplicationController
  skip_before_action :user_logged_in?
  
      def index
        @notes = note.where(activated: true).paginate(page: params[:page]).search(params[:search])
      end
    end