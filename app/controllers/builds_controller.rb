class BuildsController < ApplicationController
  before_action :set_build, only: %i[ show edit update destroy ]

  # GET /builds or /builds.json
  def index
    @builds = Build.all
  end

  # GET /builds/1 or /builds/1.json
  def show
  end

  # GET /builds/new
  def new
    @build = Build.new
  end

  # GET /builds/1/edit
  def edit
  end

  # POST /builds or /builds.json
  def create
    @build = Build.new(build_params)

    respond_to do |format|
      if @build.save
        format.html { redirect_to build_url(@build), notice: "Build was successfully created." }
        format.json { render :show, status: :created, location: @build }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @build.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /builds/1 or /builds/1.json
  def update
    respond_to do |format|
      if @build.update(build_params)
        format.html { redirect_to build_url(@build), notice: "Build was successfully updated." }
        format.json { render :show, status: :ok, location: @build }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @build.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /builds/1 or /builds/1.json
  def destroy
    @build.destroy!

    respond_to do |format|
      format.html { redirect_to builds_url, notice: "Build was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_build
      @build = Build.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def build_params
      params.require(:build).permit(:title)
    end
end
