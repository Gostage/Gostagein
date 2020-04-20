class AddColumnsToReviews < ActiveRecord::Migration[5.2]
  def change
  	add_reference :reviews, :review_user, foreign_key: { to_table: :users}
  	add_reference :reviews, :review_internship, foreign_key: { to_table: :internships}
  end
end
