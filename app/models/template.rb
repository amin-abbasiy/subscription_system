class Template < ApplicationRecord
  belongs_to :user
  belongs_to :organisation

  has_many :sections, dependent: :destroy
  has_many :comments
end
