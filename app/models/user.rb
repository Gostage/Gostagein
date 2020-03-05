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

  has_many :favorites
  has_many :internships, through: :favorites

  has_many :comments

end
