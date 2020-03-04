class Internship < ApplicationRecord
  validates :adress,
    presence: true,
    length: { in: 3..50}
  validates :zipcode,
    presence: true,
    format: { with: /\A\d{5}-\d{4}|\A\d{5}\z/ }
  validates :city,
    presence: true,
    length: { in: 1..50 }
  validates :specialty,
    presence: true,
    inclusion: { in: ["Autre"]}
  validates :organization,
    presence: true,
    inclusion: { in: ["EHPAD", "CHU", "Ecole", "Prison", "Clinique", "Autre"] }
  validates :population,
    presence: true,
    inclusion: { in: ["Personnes âgées", "Enfants", "Adolescents", "Adultes", "Autre"] }
  validates :description,
    presence: true,
    length: { in: 30..1000 }
  validates :notation,
    presence: true,
    inclusion: { in: 0..10},
    format: { with: /\A\d+\.*\d{0,1}\z/ }
  belongs_to :user
  has_many :comments
end
