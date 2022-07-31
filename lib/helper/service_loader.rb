require "active_support/concern"

module ServiceLoader
  extend ActiveSupport::Concern

  included do
    include ::Interactor
    include ::Virtus.model
    include ::ActiveModel::Validations
  end
end