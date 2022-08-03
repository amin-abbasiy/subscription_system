class Api::V1::SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    subscription = ::Subscription::Create.call(subscription_params).subscription
    render json: subscription
  end

  private
  def subscription_params
    params.permit(:default_payment_method ,:description,
                  :interval, :interval_count).merge(plan_id: params[:plan_id],
                                                    subscriber_id: current_user.id,
                                                    on_behalf_id: current_user.organisation.id,
                                                    trial: params[:trial])
  end
end
