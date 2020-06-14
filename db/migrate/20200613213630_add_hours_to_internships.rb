class AddHoursToInternships < ActiveRecord::Migration[5.2]
  def change
  	add_column :internships, :hourly_duration, :integer
  end
end
