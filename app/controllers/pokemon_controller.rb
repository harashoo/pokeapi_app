class PokemonController < ApplicationController
  def new
    search_params = params[:search]
    response = Faraday.get "https://pokeapi.co/api/v2/pokemon/#{search_params}"

    if response.status == 200
      @results = JSON.parse(response.body)
    end
  end
end
