class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update]
  before_action :authenticate_user!

  # GET /favorites
  # GET /favorites.json
  def index
    @favorites = current_user.favorites.order(created_at: :desc)
  end

  # GET /favorites/1
  # GET /favorites/1.json
  def show
  end

  # GET /favorites/new
  def new
    @favorite = Favorite.new
  end

  # GET /favorites/1/edit
  def edit
  end

  # POST /favorites
  # POST /favorites.json
  def create
    @favorite = Favorite.new(favorite_internship_id: params[:internship_id], favorite_user_id: current_user.id)

    respond_to do |format|
      if @favorite.save
        format.html { redirect_back fallback_location: root_path, notice: 'Favorite was successfully created.' }
        format.json { render :show, status: :created, location: @favorite }
      else
        format.html { redirect_back fallback_location: root_path, notice: "Le favoris n'a pas pu être créé : #{@favorite.errors.messages}" }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorites/1
  # PATCH/PUT /favorites/1.json
  def update
    respond_to do |format|
      if @favorite.update(favorite_params)
        format.html { redirect_to @favorite, notice: 'Favorite was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite }
      else
        format.html { render :edit }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.json
  def destroy
    if params[:internship_id]
      Favorite.find_by(favorite_user_id: current_user.id, favorite_internship_id: params[:id]).destroy
    else
      Favorite.find(params[:id]).destroy
    end

    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Favorite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_params
      params.require(:favorite).permit(:favorite_user_id, :favorite_internship_id)
    end

end
