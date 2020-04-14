class AddQuantityToFarmProducts < ActiveRecord::Migration[6.0]
  def change
      add_column :farms, :quantity, :integer
  end
end
