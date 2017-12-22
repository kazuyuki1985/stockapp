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

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    # データの保存
    if @project.save
      # saveがtrueだったらHOMEへ移動
      redirect_to projects_path
    else
       # saveがfalseだったら入力フォームに戻る
      render 'new'
    end
  end

  private

    def project_params
        params[:project].permit(:title)
    end

end