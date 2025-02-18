class BuildsController < ApplicationController
  before_action :set_build, only: %i[ show edit update destroy ]

  def index
    @builds = Build.all
  end

  def show
  end

  def new
    @build = Build.new
  end

  def edit
  end

  def create
    @build = Build.new(build_params)

    if @build.save
      respond_to do |format|
        format.html { redirect_to build_url(@build), notice: "Build was successfully created." }
        format.turbo_stream { render turbo_stream: turbo_stream.action(:visit, build_url(@build)) }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @build.update(build_params)
      redirect_to build_url(@build), notice: "Build was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @build.destroy!

    redirect_to builds_url, notice: "Build was successfully destroyed."
  end

  private

  def set_build
    @build = Build.find(params[:id])
  end

  def build_params
    params.require(:build).permit(:title)
  end
end
