class AddColumnsToInternships < ActiveRecord::Migration[5.2]
  def change
    add_column :internships, :title, :string
    add_column :internships, :cursus, :string
  end
end
