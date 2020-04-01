class AddRemunerationToInternships < ActiveRecord::Migration[5.2]
  def change
    add_column :internships, :remuneration, :integer
  end
end
