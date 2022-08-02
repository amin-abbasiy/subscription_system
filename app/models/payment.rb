class Payment < ApplicationRecord
  belongs_to :organisation, foreign_key: :on_behalf_id, optional: true
  belongs_to :user
  belongs_to :invoice
end
