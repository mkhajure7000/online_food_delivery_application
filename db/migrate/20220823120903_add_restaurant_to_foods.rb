class AddRestaurantToFoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :foods, :restaurant, null: false, foreign_key: true
  end
end
