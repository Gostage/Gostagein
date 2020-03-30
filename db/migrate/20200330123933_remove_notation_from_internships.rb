class RemoveNotationFromInternships < ActiveRecord::Migration[5.2]
  def change
    remove_column :internships, :notation, :float
  end
end
