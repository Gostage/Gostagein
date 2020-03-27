class StaticPagesController < ApplicationController
  def home
    @q = Internship.ransack(params[:q])
    @internships = @q.result
  end
end
