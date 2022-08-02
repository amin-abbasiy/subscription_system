class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |e|
    render_json_error :not_found, :record_not_found, message: e
  end

  rescue_from ::ActiveRecord::RecordNotUnique do |exception|
    errors_messages = [exception.message.sub(/ \[[^\]]*\]/, '')]
    render_json_error :conflict, :record_not_uniq, message: errors_messages
  end

  rescue_from ::ActiveRecord::RecordInvalid do |exception|
    errors_messages = [exception.message.sub(/ \[[^\]]*\]/, '')]
    render_json_error :bad_request, :record_invalid, message: errors_messages
  end

  rescue_from ::ArgumentError do |_exception|
    errors_messages = [_exception.message]
    render_json_error :bad_request, :argument_error, message: errors_messages
  end


  def render_json_error(status, error_code, extra = {})
    status = Rack::Utils::SYMBOL_TO_STATUS_CODE[status] if status.is_a? Symbol

    error = {
      title: I18n.t("error_messages.#{error_code}.title"),
      status: status,
      code: I18n.t("error_messages.#{error_code}.code")
    }.merge(extra)

    detail = I18n.t("error_messages.#{error_code}.detail", default: '')
    error[:detail] = detail unless detail.empty?

    render json: { errors: [error] }, status: status
  end

  def render_json_validation_error(resource)
    render json: resource, status: :bad_request, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
  end

end
