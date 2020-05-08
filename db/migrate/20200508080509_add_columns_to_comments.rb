class AddColumnsToComments < ActiveRecord::Migration[5.2]
  def change
  	add_reference :comments, :questioner, foreign_key: { to_table: :users}
  	add_reference :comments, :questioned_internship, foreign_key: { to_table: :internships}
  end
end
