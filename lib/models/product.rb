class Product < ActiveRecord::Base
    has_many :farm_products
    has_many :farms, through: :farm_products

end