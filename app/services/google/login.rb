class Google::Login
  include ::ServiceLoader

  def call
    url =  ENV.fetch('GOOGLE_AUTH_URL') + "?" + url_params
    context[:url] = url
  end

  def url_params
    %Q{
    client_id=#{ENV.fetch('GOOGLE_CLIENT_ID')}&
    redirect_uri=#{ENV.fetch('GOOGLE_REDIRECT_URL')}&
    response_type=code&
    access_type=offline&
    login_hint=sub&
    state=#{::Jwt::Encode.call(payload: { uid: ::SecureRandom.uuid }).token }
    }.gsub(/\s+/, "") + "&scope=#{ENV.fetch('GOOGLE_SCOPES')}"
  end
end
# ::Google::Login.call