class BacteriaController < ApplicationController
  before_action :authorize_bacterium
  before_action :set_bacterium, only: %i[ show edit update destroy ]

  # GET /bacteria or /bacteria.json
  def index
    @bacteria = Bacterium.all
  end

  # GET /bacteria/1 or /bacteria/1.json
  def show
  end

  # GET /bacteria/new
  def new
    @bacterium = Bacterium.new
  end

  # GET /bacteria/1/edit
  def edit
  end

  # POST /bacteria or /bacteria.json
  def create
    @bacterium = Bacterium.new(bacterium_params)

    respond_to do |format|
      if @bacterium.save
        format.html { redirect_to bacterium_url(@bacterium), notice: "Bacterium was successfully created." }
        format.json { render :show, status: :created, location: @bacterium }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bacterium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bacteria/1 or /bacteria/1.json
  def update
    respond_to do |format|
      if @bacterium.update(bacterium_params)
        format.html { redirect_to bacterium_url(@bacterium), notice: "Bacterium was successfully updated." }
        format.json { render :show, status: :ok, location: @bacterium }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bacterium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bacteria/1 or /bacteria/1.json
  def destroy
    @bacterium.destroy

    respond_to do |format|
      format.html { redirect_to bacteria_url, notice: "Bacterium was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bacterium
      @bacterium = Bacterium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bacterium_params
      params.require(:bacterium).permit(:description)
    end

    def authorize_bacterium
      authorize Bacterium
    end
end
