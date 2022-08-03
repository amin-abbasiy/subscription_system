class Subscription::Create
  include ::ServiceLoader

  attribute :default_payment_method, ::String
  attribute :description, ::String
  attribute :interval, ::String
  attribute :interval_count, ::Integer
  attribute :plan_id, ::Integer
  attribute :subscriber_id ::Integer
  attribute :on_behalf_id ::Integer
  attribute :trail
  attribute :plan, ::Plan
  attribute :user, ::User
  attribute :organisation, ::Organisation
  attribute :subscription, ::Subscription

  validates :default_payment_method, presence: true
  validates :description, presence: true
  validates :interval, presence: true
  validates :interval_count, presence: true
  validates :plan_id, presence: true
  validates :subscriber_id, presence: true
  validates :on_behalf_id, presence: true

  def call
    @plan = ::Plan.find_by(id: @plan_id)
    @user = ::User.find_by(id: @subscriber_id)
    @organisation = ::Organisation.find_by(id: @on_behalf_id)

    if @trial.present?
      @trial_start = Time.now.trial_days
      @trial_end = Time.now + trial_days.days
    end

    @current_period_start = Time.now.utc
    @current_period_end = Time.now.utc + (ENV["INTERVAL_DAYS_#{@interval.upcase}"] * @interval_count)

    @subscription = ::Subscription.create({ currency: @plan.currency, status: 'active', interval: @interval,
                                            interval_count: @interval_count, trial_start: @trial_start, trail_end: @trial_end,
                                            description: @description, current_period_start: @current_period_start,
                                            current_period_end: @current_period_end,
                                            default_payment_method: ENV['DEFAULT_PAYMENT_METHOD']}.compact)

    @subscription.relaod
    create_invoice

    context[:subscription] = @subscription
  end

  def create_invoice
    total_amount = ::Invoice::TotalAmount.call(organisation: @organisation, title: @plan.title).amount
    @invoice = ::Invoice.create({ title: @plan.title, user: @user, on_behalf_id: @organisation.id, description: ENV['INVOICE_DESCRIPTION'],
                                 currency: subscription.currency, total_amount: total_amount.to_i, total_amount_decimal: total_amount.to_i,
                                 subscription: @subscription, start_subscription: @subscription.current_period_start,
                                  end_subscription: @subscription.current_period_end, status: 'open'}.compact)
    @subscription.uppdate(last_invoice_id: @invoice.id)
  end
end

# ::Subscription::Create.call()
