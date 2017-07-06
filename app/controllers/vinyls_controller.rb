class VinylsController < ApplicationController
  before_action :set_vinyl, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!, except: [:index, :show]

  # GET /vinyls
  # GET /vinyls.json
  def index
    @vinyls = Vinyl.all
  end

  # GET /vinyls/1
  # GET /vinyls/1.json
  def show
    # @tweet = Tweet.find(params[:id])
    @vinyl = Vinyl.find(params[:id])  # was blank
  end

  # GET /vinyls/new
  def new
    @vinyl = Vinyl.new
    # @vinyl = current_user.vinyls.new
  end

  # GET /vinyls/1/edit
  def edit
    # @vinyl = current_user.vinyl.find(params[:id])  # was blank
  end

  # POST /vinyls
  # POST /vinyls.json
  def create
    @vinyl = Vinyl.new(vinyl_params)

    respond_to do |format|
      if @vinyl.save
        format.html { redirect_to @vinyl, notice: 'Vinyl was successfully created.' }
        # format.json { render :show, status: :created, location: @vinyl }
      else
        format.html { render :new }
        # format.json { render json: @vinyl.errors, status: :unprocessable_entity }
      end
    end
  end

  # def create
  #   @vinyl = current_user.vinyl.new(vinyl_params)
  #   if @vinyl.save
  #     redirect_to @vinyl, notice: 'Vinyl was successfully created.' 
  #   else
  #     render :new 
  #   end
  # end

  # PATCH/PUT /vinyls/1
  # PATCH/PUT /vinyls/1.json
  def update
    respond_to do |format|
      if @vinyl.update(vinyl_params)
        format.html { redirect_to @vinyl, notice: 'Vinyl was successfully updated.' }
        # format.json { render :show, status: :ok, location: @vinyl }
      else
        format.html { render :edit }
        # format.json { render json: @vinyl.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update
  #   @vinyl = current_user.vinlys.find(params[:id])
  #   if @vinyl.update(vinyl_params)
  #     redirect_to @vinyl, notice: 'Vinyl was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # DELETE /vinyls/1
  # DELETE /vinyls/1.json
  def destroy
    @vinyl.destroy
    respond_to do |format|
      format.html { redirect_to vinyls_url, notice: 'Vinyl was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  # def destroy
  #   @vinyl = current_user.vinyls.find(params[:id])
  #   @vinyl.destroy
  #   redirect_to vinyl_url, notice: 'Vinyl was successfully destroyed.'
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vinyl
      @vinyl = Vinyl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vinyl_params
      params.require(:vinyl).permit(:title, :artist, :notes)
    end
end
