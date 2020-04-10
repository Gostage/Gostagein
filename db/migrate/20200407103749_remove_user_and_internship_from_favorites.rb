class RemoveUserAndInternshipFromFavorites < ActiveRecord::Migration[5.2]
  def change
  	remove_column :favorites, :user_id, :integer
  	remove_column :favorites, :internship_id, :integer
  end
end
