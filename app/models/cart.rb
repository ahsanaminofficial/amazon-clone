class Cart < ApplicationRecord
    belongs_to :user
    has_many :products
    has_many :ThroughTableCartProduct
end
