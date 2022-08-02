class Api::V1::HomesController < ApplicationController
  before_action :authenticate_user!

  def index
    offset = (params[:page] * params[:per]) - params[:per]
    @templates = ::Template.list(params[:per], page, offset)
    render json: @templates
  end


end
