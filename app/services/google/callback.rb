class Google::Callback
  include ::ServiceLoader

  attribute :code

  validates :code, presence: true

  def call
    url =  ENV.fetch('GOOGLE_TOKEN_URL')
    headers = { 'Content-Type' => "application/json" }

    request = ::Google::Request.call(http_method: :post, url: url,
                                      headers: headers, body: body)


    json_response = request.response.parsed_response
    profile = JWT.decode(json_response['id_token'], nil, false).first


    @provider = ::AuthProvider.find_by(email: profile["email"])

    if @provider.blank?
      user = create_user(profile)
      @provider = create_provider(json_response, user, profile["email"])
    end

    context[:provider] = @provider

  end

  def create_user(profile)
    user = ::User.create(email: profile["email"], first_name: profile["given_name"], status: 'active')
    user.reload

    user
  end

  def create_provider(json_response, user, email)
    expires_in = Time.now.utc + json_response['expires_in'].to_i.seconds

    provider = ::AuthProvider.create(provider_type: 'google', user_id: user.id,
                                     access_token: json_response['access_token'],
                                     refresh_token: json_response['refresh_token'],
                                     access_token_exp: expires_in,
                                     id_token: json_response['id_token'],
                                     email: email)

    provider.reload

    provider
  end

  def body
    {
      client_id: ENV.fetch('GOOGLE_CLIENT_ID'),
      client_secret: ENV.fetch('GOOGLE_CLIENT_SECRET'),
      code: @code,
      grant_type: 'authorization_code',
      redirect_uri: ENV.fetch('GOOGLE_REDIRECT_URL')
    }.to_json
  end
end
# ::Google::Callback.call(code: )
