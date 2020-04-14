class FarmProduct < ActiveRecord::Base
    belongs_to :farm
    belongs_to :product
end