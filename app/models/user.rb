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

  has_many :comments, foreign_key: "questioner_id", dependent: :destroy
  has_many :commentables, foreign_key: "commentable_id", through: :comments

  has_many :reviews, foreign_key: "review_user_id"
  has_many :review_internships, foreign_key: 'review_internship_id', class_name: "Internship", through: :reviews

  has_many :favorites, foreign_key: "favorite_user_id"
  has_many :favorite_internships, foreign_key: "favorite_internship_id", class_name: "Internship", through: :favorites

  def unread_internships_comments
    unread_comments = []
    unless self.internships == nil || self.internships == []
      self.internships.each do |internship|
        internship.comments.where(read: false).each do |comment|
          unread_comments << comment
        end
      end
    end
    return unread_comments
  end

  def unread_comments_answers
    unread_answers = []
    unless self.comments == nil || self.comments == []
      self.comments.each do |comment|
        comment.comments.where(read: false).each do |answer|
          unread_answers << answer
        end
      end
    end
    return unread_answers
  end

  def add_to_mailchimp_list
    gibbon = Gibbon::Request.new
    

  end

end
