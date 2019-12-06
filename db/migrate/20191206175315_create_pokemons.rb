class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.integer :order
      t.string :name
      t.string :image_url

      t.timestamps
    end
  end
end
