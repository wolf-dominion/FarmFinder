class CreateFarmsTable < ActiveRecord::Migration[6.0]
    def change
      create_table :farms do |t|
        t.string :name
      end
    end
  end

class CreateProductTable < ActiveRecord::Migration[6.0]
    def change
      create_table :products do |t|
      t.string :name
      t.integer :quantity
      end
    end
  end
  

class CreateFarmProductsTable < ActiveRecord::Migration[6.0]
    def change
      create_table :farm_products do |t|
        t.references :farms, foreign_key: true
        t.references :products, foreign_key: true
      end
    end
  end
  