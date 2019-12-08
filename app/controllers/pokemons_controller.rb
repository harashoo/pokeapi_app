class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def new
    return if params[:search].blank?

    client = ApiClient.new
    response = client.get_pokemon(params[:search])

    if response.status != 200
      return redirect_to new_pokemon_path, notice: "#{response.status}エラー！"
    end

    @pokemon = Pokemon.new(order: response.id, name: response.name, image_url: response.sprites.front_default)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.save
      redirect_to pokemons_path, notice: "「#{@pokemon.name}」をゲットしました。"
    else
      render :new
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:order, :name, :image_url)
  end
end
