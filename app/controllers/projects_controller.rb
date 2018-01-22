class ProjectsController < ApplicationController

  before_action :set_project, only:[:show, :edit, :update, :destroy]
    # indexアクションを追加
    def index
        # @をつけた変数はviewでそのまま使用可能
        # Projectの全データを引っ張ってくる
        @projects = Project.all
    end

      # showアクションを追加
  def show
    render partial: "show" if request.xhr? 
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

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end
  

  private

    def project_params
        params[:project].permit(:title)
    end

    def set_project
      @project = Project.find(params[:id])
    end

end