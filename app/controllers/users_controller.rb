class UsersController < ApplicationController
  before_action :authenticate_user!

      def index
        @notes = note.where(activated: true).paginate(page: params[:page]).search(params[:search])
      end
    end