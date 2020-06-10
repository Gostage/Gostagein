class StaticPagesController < ApplicationController
  def home
    @q = Internship.ransack(params[:q])
    @internships = @q.result

    @last_internships = Internship.order(created_at: :desc).take(6)

    @users = User.all

    @reviews = Review.all

    @comments = Comment.all
  end
end
