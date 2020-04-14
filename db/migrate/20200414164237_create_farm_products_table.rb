class CreateFarmProductsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :farm_products do |t|
      t.references :farms, foreign_key: true
      t.references :products, foreign_key: true
    end
  end
end
