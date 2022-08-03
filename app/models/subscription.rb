
class Subscription < ApplicationRecord
  belongs_to :organisation, foreign_key: :on_behalf_id, optional: true
  belongs_to :user
  belongs_to :plan
  has_many :invoices

  enum status: { incomplete: 0, incomplete_expired: 1,
                 trialing: 2, active: 3, past_due: 4,
                 canceled: 5, unpaid: 6 }
end
