class Invoice::TotalAmount
  include ::ServiceLoader

  attribute :organisation, ::Organisation
  attribute :title, ::String

  validates :organisation, presence: true
  validates :title, presence: true


  def call
    plan = ::Plan.find_by(title: @title)

    #assign default amount
    amount = plan.amount.to_f
    each_additional_cost = plan.additional_user_rate

    #check for org additional users
    org_users = @organisation.user.count
    allowed_list = plan.quantity
    extra_users = org_users - allowed_list

    #calculate cost of additional user
    amount += each_additional_cost.to_f * extra_users if extra_users > 0

    amount

    context[:amount] = amount
  end
end

# ::Invoice::TotalAmount.call(organisation: , title: )
