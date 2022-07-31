class Api::V1::AuthProvidersController < ApplicationController
    def google_login
        url = 'https://accounts.google.com/o/oauth2/v2/auth'
        client_id = ""
        redirect_uri = ''
        response_type = 'code'
        scope = "email profile openid"
        access_type = "offline"
        state = ""
        login_hint = "sub"

    end
    def google_callback
        url = 'https://oauth2.googleapis.com/token'
        client_id = ""
        client_secret = ""
        code = params[:code]
        grant_type = 'authorization_code'
        redirect_uri = ''

        res = {
            "access_token": "1/fFAGRNJru1FTz70BzhT3Zg",
            "expires_in": 3920,
            "token_type": "Bearer",
            "scope": "https://www.googleapis.com/auth/drive.metadata.readonly",
            "refresh_token": "1//xEoDL4iW3cxlI7yDbSRFYNG01kVKM2C-259HOF2aQbI"
          }
          JWT.decode(params[:id_token], nil, false)

    end
    def refresh_token
        client_id 
        client_secret
        grant_type = 'refresh_token'
        refresh_token = ""

        res = {
            "access_token": "1/fFAGRNJru1FTz70BzhT3Zg",
            "expires_in": 3920,
            "scope": "https://www.googleapis.com/auth/drive.metadata.readonly",
            "token_type": "Bearer"
          }
    end

    def revoke_token
        url = "https://oauth2.googleapis.com/revoke?token=#{token}"
    end
end
