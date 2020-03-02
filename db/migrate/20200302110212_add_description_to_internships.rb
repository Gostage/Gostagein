class AddDescriptionToInternships < ActiveRecord::Migration[5.2]
  def change
  	add_column :internships, :description, :text
  end
end
