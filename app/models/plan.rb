class Plan < ApplicationRecord
  enum status: { active: 0, inactive: 1 }
  enum interval: { monthly: 0, annual: 1 }
  has_many :subscriptions
end
