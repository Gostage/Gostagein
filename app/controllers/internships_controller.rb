class InternshipsController < ApplicationController
  before_action :set_internship, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /internships
  # GET /internships.json
  def index
    @q = Internship.ransack(params[:q])
    @internships = @q.result
  end

  # GET /internships/1
  # GET /internships/1.json
  def show
    @reviews_of_internship = @internship.reviews.order(created_at: :desc).paginate(page: params[:page], per_page: 4)
    @review = Review.new
    @internship_comments = @internship.comments.order(created_at: :desc).paginate(page: params[:page], per_page: 4)
    @favorite = Favorite.new
    @favorite_exists = Favorite.where(favorite_internship_id: params[:id], favorite_user_id: current_user.id) 
    @new_internship_comment = @internship.comments.build

    if current_user.id == @internship.user_id
      @internship.comments.where(read: false).each do |unread_comment|
        unread_comment.update(read: true)
      end
    end
    
    @internship.comments.each do |comment|
      if current_user.id == comment.questioner_id
        comment.comments.where(read: false).each do |unread_answer|
          unread_answer.update(read: true)
        end
      end
    end

    # To add empty stars in average notation
    @stars_empty = 5 - @internship.average_notation

  end

  # GET /internships/new
  def new
    @internship = Internship.new
  end

  # GET /internships/1/edit
  def edit
    current_user_must_own_internship
  end

  # POST /internships
  # POST /internships.json
  def create
    @internship = Internship.new(internship_params)
    @internship.user = current_user
    respond_to do |format|
      if @internship.save
        format.html { redirect_to @internship, notice: 'Expérience créée avec succès' }
        format.json { render :show, status: :created, location: @internship }
      else
        format.html { render :new }
        format.json { render json: @internship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internships/1
  # PATCH/PUT /internships/1.json
  def update
    respond_to do |format|
      if @internship.update(internship_params)
        format.html { redirect_to @internship, notice: 'Expérience enregistrée avec succès' }
        format.json { render :show, status: :ok, location: @internship }
      else
        format.html { render :edit }
        format.json { render json: @internship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internships/1
  # DELETE /internships/1.json
  def destroy
    @internship.destroy

    respond_to do |format|
      format.html { redirect_to internships_url, notice: 'Expérience supprimée avec succès.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internship
      @internship = Internship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def internship_params
      params.require(:internship).permit(:adress, :zipcode, :city, :specialty, :organization, :population, :cursus, :title, :duration, :description, :region, :remuneration, :user_id, :notation, :feeling, :overall_notation)
    end

    # Editing permission only for owner
    def current_user_must_own_internship
      if current_user.id != @internship.user.id
        redirect_to internship_path(@internship.id)
      end
    end
end
