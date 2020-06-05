class AddNotationAndFeelingToInternship < ActiveRecord::Migration[5.2]
  def change
    add_column :internships, :notation, :integer
    add_column :internships, :feeling, :string
  end
end
