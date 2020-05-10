class Comment < ApplicationRecord
  validates :content,
    presence: true,
    uniqueness: true,
    length: { maximum: 300 }
  belongs_to :questioner, class_name: "User"
  belongs_to :questioned_internship, class_name: "Internship"
end
