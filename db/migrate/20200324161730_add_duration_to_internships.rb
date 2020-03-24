class AddDurationToInternships < ActiveRecord::Migration[5.2]
  def change
    add_column :internships, :duration, :float
  end
end
