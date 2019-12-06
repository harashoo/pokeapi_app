class PokemonController < ApplicationController
  def new
    if params[:search].present?
      search_params = params[:search]
      @client = ApiClient.new
      @pokemon = @client.get_pokemon(search_params)
    end
  end

  def create
    
  end
end
