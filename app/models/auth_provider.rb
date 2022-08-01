class AuthProvider < ApplicationRecord
  belongs_to :user

  enum provider_type: { google: 0 }
end
