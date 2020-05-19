class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
    current_user_must_own_review
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(title: params[:title], notation: params[:notation], description: params[:description], review_user_id: params[:review_user_id], review_internship_id: params[:review_internship_id])
    @review.review_user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_back fallback_location: root_path, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { redirect_back fallback_location: root_path, notice: "L'avis n'a pas pu être créé : #{@review.errors.messages}" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy

    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:title, :notation, :description, :review_internship, :review_user)
    end

    # Editing permission only for owner
    def current_user_must_own_review
      if current_user.id != @review.review_user_id
        redirect_to review_path(@review.id)
      end
    end
end
