class Api::V1::GooglesController < ApplicationController
    def login
        url = ::Google::Login.call
        render json: { redirect_uri: url.url }
    end
    def callback
        token_request = ::Google::Callback.call(code: params[:code])
        render json: { message: "User logged in with email #{ token_request.provider.email }" }
    end
end
