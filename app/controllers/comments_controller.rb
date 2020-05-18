class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_commentable
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :current_user_must_own_comment, only: [:edit, :update, :destroy]

  # GET /comments/new
  def new
    @comment = @commentable.comments.build
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.questioner = current_user
    if params[:comment_id] && params[:internship_id]
      @comment.commentable_type = "Comment"
    else
      @comment.commentable_type = "Internship"
    end

    respond_to do |format|
      if @comment.save
        if params[:comment_id] && params[:internship_id]
          format.html { redirect_to internship_path(@commented_internship), notice: 'Le commentaire a été posté.' }
          format.json { render :show, status: :created, location: @comment }
        else 
          format.html { redirect_to internship_path(@commentable), notice: 'Le commentaire a été posté.' }
          format.json { render :show, status: :created, location: @comment }    
        end
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
        if params[:comment_id] && params[:internship_id]
          format.html { redirect_to internship_path(@commented_internship), notice: 'Le commentaire a été modifié.' }
          format.json { render :show, status: :ok, location: @comment }
        else
          format.html { redirect_to internship_path(@commentable), notice: 'Le commentaire a été modifié.' }
          format.json { render :show, status: :ok, location: @comment }
        end
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
      if params[:comment_id] && params[:internship_id]
        format.html { redirect_to internship_path(@commented_internship), notice: 'Le commentaire a été supprimé.' }
        format.json { head :no_content }
      else
        format.html { redirect_to internship_path(@commentable), notice: 'Le commentaire a été supprimé.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @commentable.comments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :questioner_id, :commentable_id)
    end

    # Editing permission only for owner
    def current_user_must_own_comment
      if current_user.id != @comment.questioner.id
        if params[:comment_id] && params[:internship_id]
          redirect_to internship_path(@commented_internship)
        else
          redirect_to internship_path(@commentable)
        end 
      end
    end

    def get_commentable
      if params[:comment_id]
        @commentable = Comment.find(params[:comment_id])
        @commented_internship = Internship.find(params[:internship_id])
      else
        @commentable = Internship.find(params[:internship_id])
      end
    end

end
