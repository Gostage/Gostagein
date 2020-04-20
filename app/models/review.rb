class Review < ApplicationRecord
  validates :title,
    presence: true,
    length: { in: 10..150}
  validates :description,
    presence: true,
    length: { in: 30..1000 }
  validates :notation,
    presence: true,
    inclusion: { in: 1..5},
    format: { with: /\A\d+\.*\d{0,1}\z/ }

  belongs_to :review_user, class_name: "User"
  belongs_to :review_internship, class_name: "Internship"

end
