class Comment < ApplicationRecord
  belongs_to :template
  belongs_to :user
  belongs_to :section
  has_many :replies, class_name: "Comment", foreign_key: :parent_id

end
