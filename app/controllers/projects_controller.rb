class ProjectsController < ApplicationController

    # indexアクションを追加
    def index
        # @をつけた変数はviewでそのまま使用可能
        # Projectの全データを引っ張ってくる
        @projects = Project.all
    end

      # showアクションを追加
  def show
    @project = Project.find(params[:id])
  end
end