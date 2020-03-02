class CreateInternships < ActiveRecord::Migration[5.2]
  def change
    create_table :internships do |t|
      t.string :adress
      t.string :zipcode
      t.string :city
      t.string :specialty
      t.string :organization
      t.string :population
      t.float :notation

      t.timestamps
    end
  end
end
