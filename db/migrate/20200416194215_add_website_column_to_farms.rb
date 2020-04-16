class AddWebsiteColumnToFarms < ActiveRecord::Migration[6.0]
  def change
    add_column :farms, :website, :text
  end
end
