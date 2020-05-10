class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_questioned_internship
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :current_user_must_own_comment, only: [:edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = @questioned_internship.comments
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = @questioned_internship.comments.build
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @questioned_internship.comments.build(comment_params)
    @comment.questioner = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to internship_comments_path(@questioned_internship), notice: 'Le commentaire a été posté.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to internship_comments_path(@questioned_internship), notice: 'Le commentaire a été modifié.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to internship_comments_path(@questioned_internship), notice: 'Le commentaire a été supprimé.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @questioned_internship.comments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :questioner_id, :questioned_internship_id)
    end

    # Editing permission only for owner
    def current_user_must_own_comment
      if current_user.id != @comment.questioner.id
        redirect_to internship_comments_path(@questioned_internship)
      end
    end

    def get_questioned_internship
      @questioned_internship = Internship.find(params[:internship_id])
    end

end
