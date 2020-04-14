class Farm < ActiveRecord::Base
    has_many :farm_products
    has_many :products, through: :farm_products
end