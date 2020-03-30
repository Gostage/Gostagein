class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.float :notation
      t.text :description
      t.belongs_to :internship, foreign_key: true

      t.timestamps
    end
  end
end
