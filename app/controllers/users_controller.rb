class UsersController < ApplicationController
    (中略)
      def index
        @notes = note.where(activated: true).paginate(page: params[:page]).search(params[:search])
      end
    (中略)
    end