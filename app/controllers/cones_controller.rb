class ConesController < ApplicationController
  before_action :set_cone, only: [:show, :edit, :update, :destroy]

  # GET /cones
  # GET /cones.json
  def index
    @cones = current_user.links
  end

  # GET /cones/1
  # GET /cones/1.json
  def show
  end

  # GET /cones/new
  def new
    @cone = Cone.new
  end

  # GET /cones/1/edit
  def edit
  end

  # POST /cones
  # POST /cones.json
  def create
    @cone = Cone.new(cone_params)

    respond_to do |format|
      if @cone.save
        format.html { redirect_to @cone, notice: 'Cone was successfully created.' }
        format.json { render :show, status: :created, location: @cone }
      else
        format.html { render :new }
        format.json { render json: @cone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cones/1
  # PATCH/PUT /cones/1.json
  def update
    respond_to do |format|
      if @cone.update(cone_params)
        format.html { redirect_to @cone, notice: 'Cone was successfully updated.' }
        format.json { render :show, status: :ok, location: @cone }
      else
        format.html { render :edit }
        format.json { render json: @cone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cones/1
  # DELETE /cones/1.json
  def destroy
    @cone.destroy
    respond_to do |format|
      format.html { redirect_to cones_url, notice: 'Cone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cone
      @cone = Cone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cone_params
      params.require(:cone).permit(:price, :status)
    end
end
