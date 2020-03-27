class AddRegionToInternships < ActiveRecord::Migration[5.2]
  def change
    add_column :internships, :region, :string
  end
end
