require 'ostruct'

class Breeds::SearchApiService
  SUCCESS = 'success'.freeze

  def initialize(query:)
    @query = query
  end

  def call
    return parsed_response if parsed_response.status == SUCCESS

    raise Breeds::SearchApiError, parsed_response.message
  end

  private

  def parsed_response
    JSON.parse(response, object_class: OpenStruct)
  end

  def response
    @response ||= HTTP.get("https://dog.ceo/api/breed/#{@query}/images/random").to_s
  end
end
