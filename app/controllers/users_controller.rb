class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /users/1
  # GET /users/1.json
  def show
    @internships = @user.internships
    @comments = @user.comments.to_a.uniq.paginate(page: params[:page], per_page: 4)
    @reviews = @user.reviews
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {})
    end

end
