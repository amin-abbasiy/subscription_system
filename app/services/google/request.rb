class Google::Request
  include ::ServiceLoader

  attribute :http_method, ::Symbol
  attribute :url, ::String
  attribute :headers, ::JSON
  attribute :body, ::JSON

  validates :url, presence: true
  validates :headers, presence: true
  validates :http_method, presence: true

  def call
    response  = ::HTTParty.public_send(@http_method, @url, {
      headers: @headers,
      body: @body
    }.compact)

    context[:response] = response
  end
end

# ::Google::Request.call(http_method: , url: , headers: , body:)
