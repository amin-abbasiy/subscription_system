class Api::V1::InvoicesController < ApplicationController
  before_action :authenticate_user!

  def create
    total_amount = ::Invoice::TotalAmount.call(organisation: current_user.organisation,
                                                title: params[:title]).amount
  end
end
