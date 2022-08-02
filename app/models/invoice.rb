class Invoice < ApplicationRecord
  belongs_to :organisation, foreign_key: :on_behalf_id, optional: true
  belongs_to :user
  belongs_to :subscription

  has_many :payments

  enum status: { draft: 0, open: 1, paid: 2, uncollectible: 3, void: 4 }
end
