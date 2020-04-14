class AddQuantityToFarmProductsCorrectVersion < ActiveRecord::Migration[6.0]
  def change
    add_column :farm_products, :quantity, :integer
  end
end
