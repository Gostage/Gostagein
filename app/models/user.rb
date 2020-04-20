class User < ApplicationRecord
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :first_name,
    presence: true,
    length: { in: 2..20 }
  validates :last_name,
    presence: true,
    length: { in: 2..25 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :internships
  has_many :comments

  has_many :reviews, foreign_key: "review_user_id"
  has_many :review_internships, foreign_key: 'review_internship_id', class_name: "Internship", through: :reviews

  has_many :favorites, foreign_key: "favorite_user_id"
  has_many :favorite_internships, foreign_key: "favorite_internship_id", class_name: "Internship", through: :favorites

end
