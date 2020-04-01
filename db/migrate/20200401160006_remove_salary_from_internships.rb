class RemoveSalaryFromInternships < ActiveRecord::Migration[5.2]
  def change
    remove_column :internships, :salary, :float
  end
end
