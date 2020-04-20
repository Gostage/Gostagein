class RemoveInternshipAndUserFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :internship_id, :bigint
    remove_column :reviews, :user_id, :bigint
  end
end
