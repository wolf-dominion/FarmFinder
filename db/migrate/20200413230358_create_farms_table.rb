class CreateFarmsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :farms do |t|
      t.string :name
    end
  end
end
