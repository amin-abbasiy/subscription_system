class Jwt::Encode
  include ::ServiceLoader

  attribute :payload, ::Hash

  validates :payload, presence: true

  def call
    secret_key = ::Rails.application.credentials[:jwt_secret]
    token = JWT.encode @payload, secret_key, ENV.fetch('JWT_ALGORITHM')

    context[:token] = token
  end
end

# ::Jwt::Encode.call(user: )