class AddColumnsToFavorites < ActiveRecord::Migration[5.2]
  def change
  	add_reference :favorites, :favorite_user, foreign_key: { to_table: :users}
  	add_reference :favorites, :favorite_internship, foreign_key: { to_table: :internships}
  end
end
