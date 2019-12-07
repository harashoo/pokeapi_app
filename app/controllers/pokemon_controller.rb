class PokemonController < ApplicationController
  def new
    return if params[:search].blank?
    search_params = params[:search]
    @client = ApiClient.new
    @pokemon = @client.get_pokemon(search_params)
  end

  def create
    
  end
end
