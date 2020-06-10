class StaticPagesController < ApplicationController
  def home
    @internships = Internship.all.order(created_at: :desc)

    @users = User.all

    @reviews = Review.all

    @comments = Comment.all
  end
end
