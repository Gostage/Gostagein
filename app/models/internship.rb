class Internship < ApplicationRecord
  scope :sort_by_average_notation_asc, lambda { sort_by(&:average_notation) }
  scope :sort_by_average_notation_desc, lambda { sort_by(&:average_notation).reverse }

  validates :adress,
    length: { allow_blank: true, in: 3..50}
  validates :zipcode,
    format: { allow_blank: true, with: /\A\d{5}-\d{4}|\A\d{5}\z/ }
  validates :city,
    presence: true,
    length: { in: 1..50 }
  validates :specialty,
    presence: true,
    inclusion: { in: ["Hospitalier", "Maison médicale","Social", "Médico-social", "Petite enfance", "Associatif", "Scolaire", "Médico-pédagogique", "Libéral", "Recherche", "Entreprise","Privé", "Justice","Police Nationale", "Armée", "Carcéral", "Insertion professionnelle", "Recrutement", "Gestion de carrières", "Ressouces Humaines", "Marketing", "Santé au travail", "Autres"]}
  validates :organization,
    presence: true,
    length: { in: 3..150}
  validates :population,
    presence: true,
    inclusion: { in: ["Personnes âgées", "Enfants", "Adolescents", "Adultes", "Autistes", "Haut potentiel", "Personnes Cérébro-lésées", "Non pertinent", "Autres"] }
  validates :description,
    presence: true,
    length: { in: 30..1000 }
  validates :remuneration,
    presence: true,
    length: { minimum: 0 },
    format: { with: /\A[+-]?\d+\z/},
    numericality: { only_integer: true }
  validates :duration,
    presence: true,
    inclusion: { in: 1..6},
    format: { with: /\A\d+\.*\d{0,1}\z/ }
  validates :title,
    presence: true,
    length: { in: 10..150}
  validates :cursus,
    presence: true,
    inclusion: { in: ["Licence 1", "Licence 2", "Licence 3", "Master 1", "Master 2", "Doctorat", "Diplôme Universitaire"]}
  validates :region,
    presence: true,
    inclusion: { in: ["Auvergne-Rhône-Alpes", "Bourgogne-Franche-Comté", "Bretagne", "Centre-Val de Loire", "Corse", "Grand Est", "Hauts-de-France", "Île-de-France", "Normandie", "Nouvelle-Aquitaine", "Occitanie", "Pays de la Loire", "Provence-Alpes-Côte d'Azur"]}
  validates :notation,
    presence: true,
    inclusion: { in: 1..5}
  validates :feeling,
    presence: true,
    length: { in: 30..1000 }
  validates :hourly_duration,
    numericality: { greater_than: 0 },
    allow_nil: true

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :questioners, foreign_key: "questioner_id", class_name: "User", through: :comments

  has_many :reviews, foreign_key: "review_internship_id", dependent: :destroy
  has_many :review_users, foreign_key: 'review_user_id', class_name:"User", through: :reviews

  has_many :favorites, foreign_key: "favorite_internship_id", dependent: :destroy
  has_many :favorite_users, foreign_key: "favorite_user_id", class_name: "User", through: :favorites

  def has_unread_comments
    if self.comments != nil || self.comments != []
      if self.comments.where(read: false).length != 0
        return true
      else
        return false
      end
    end
  end

  def average_notation
    if self.reviews == nil || self.reviews == []
      return self.notation
    else
      all_notations = []
      self.reviews.each do |review|
        all_notations << review.notation
      end
      all_notations << self.notation
      return ((all_notations.sum)  / (all_notations.length)).round
    end
  end
end
