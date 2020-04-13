class CreateProduceTable < ActiveRecord::Migration[6.0]
  def change
    create_table :produce do |t|
    t.string :name
    t.integer :quantity
    end
  end
end
