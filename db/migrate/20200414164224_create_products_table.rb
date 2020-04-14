class CreateProductsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
    end
  end
end
