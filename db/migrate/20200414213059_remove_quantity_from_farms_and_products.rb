class RemoveQuantityFromFarmsAndProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :farms, :quantity, :integer
    remove_column :products, :quantity, :integer
  end
end
