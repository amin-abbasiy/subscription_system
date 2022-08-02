class Template < ApplicationRecord
  belongs_to :user
  belongs_to :organisation

  has_many :sections, dependent: :destroy
  has_many :comments

  scope :list, -> (per, user_id, offset) { where(user_id: user_id).order_by(:created_at)
                                                                  .offset(offset).limit(per)
                                                                  .select(:title, :comment_count, :section_count) }
end
