require 'test_helper'

class PokemonControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pokemon_new_url
    assert_response :success
  end

end
