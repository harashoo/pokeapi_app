require 'faraday'

class ApiClient
  BASE_URL = 'https://pokeapi.co/api/v2/'

  def get_pokemon(search_params)
    response(connection.get("pokemon/#{search_params}"))
  end
  
  private

  def connection
    connection = Faraday.new(url: BASE_URL)
  end

  def response(raw_response)
    return OpenStruct.new({ status: raw_response.status }) if raw_response.status != 200
    JSON.parse(raw_response.body, object_class: OpenStruct)
  end
end
