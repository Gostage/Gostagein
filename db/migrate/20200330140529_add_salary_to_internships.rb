class AddSalaryToInternships < ActiveRecord::Migration[5.2]
  def change
    add_column :internships, :salary, :float
  end
end
