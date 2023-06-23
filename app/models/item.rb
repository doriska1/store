class Item < ApplicationRecord

  validates :price, numericality: true, presence: true
end
