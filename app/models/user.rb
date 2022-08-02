class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :jwt_authenticatable, jwt_revocation_strategy: ::JwtDenylist

  has_many :auth_providers, dependent: :destroy
  belongs_to :organisation, optional: true
end
