class RenameFarmsIdToFarmId < ActiveRecord::Migration[6.0]
  def change
    rename_column :farm_products, :farms_id, :farm_id
    rename_column :farm_products, :products_id, :product_id
  end
end
