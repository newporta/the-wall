class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :load_project, only: [:update, :edit, :show]

  def index
  end

  def new
    @project = Project.new
  end

  def create
    current_user.projects.create!(
      project_params,
    )

    redirect_to :action => :index
  end

  def show
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  private

  def load_project
    @project = current_user.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :contact, :url)
  end
end
