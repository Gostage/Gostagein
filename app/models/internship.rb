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
  validates :duration,
    presence: true,
    inclusion: { in: 1..6},
    format: { with: /\A\d+\.*\d{0,1}\z/ }
  validates :title,
    presence: true,
    length: { in: 10..150}
  validates :cursus,
    presence: true,
    inclusion: { in: ["Licence 1", "Licence 2", "Licence 3", "Master 1", "Master 2"]}
  validates :region,
    presence: true,
    inclusion: { in: ["Auvergne-Rhône-Alpes", "Bourgogne-Franche-Comté", "Bretagne", "Centre-Val de Loire", "Corse", "Grand Est", "Hauts-de-France", "Île-de-France", "Normandie", "Nouvelle-Aquitaine", "Occitanie", "Pays de la Loire", "Provence-Alpes-Côte d'Azur"]}

  
  belongs_to :user

  has_many :favorites
  has_many :users, through: :favorites

  has_many :comments

end
