class StaticPagesController < ApplicationController
  def home
    @q = Internship.ransack(params[:q])
    @internships = @q.result

    @users = User.all

    @reviews = Review.all

    @comments = Comment.all
  end
end
