class RemoveQuestionedInternshipIdFromComments < ActiveRecord::Migration[5.2]
  def change
  	remove_column :comments, :questioned_internship_id, :integer
  end
end
