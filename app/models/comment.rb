class Comment < ApplicationRecord
  validates :content,
    presence: true,
    length: { maximum: 750 }
  belongs_to :questioner, class_name: "User"
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy

  def parent_internship
  	if self.commentable_type == "Internship"
  	  return Internship.find(self.commentable_id)
  	else   
  	  return Internship.find(Comment.find(self.commentable_id).commentable_id)
  	end
  end

  def parent_comment
    if self.commentable_type == "Comment"
      return Comment.find(self.commentable_id)
    end
  end

  def has_unread_answers
    if self.comments != nil || self.comments != []
      if self.comments.where(read: false).length != 0
        return true
      else
        return false
      end
    else
      return false
    end
  end
end
