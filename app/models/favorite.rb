class Favorite < ApplicationRecord
  belongs_to :favorite_user, class_name: "User"
  belongs_to :favorite_internship, class_name: "Internship"
end
