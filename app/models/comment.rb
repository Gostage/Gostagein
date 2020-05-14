class Comment < ApplicationRecord
  validates :content,
    presence: true,
    length: { maximum: 300 }
  belongs_to :questioner, class_name: "User"
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  def parent_internship
  	if self.commentable_type == "Internship"
  	  return Internship.find(self.commentable_id)
  	else   
  	  return Internship.find(Comment.find(self.commentable_id).commentable_id)
  	end
  end
end
