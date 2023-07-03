# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  name       :string
#  price      :decimal(6, 2)
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Item < ApplicationRecord

  validates :price, numericality: true, presence: true

  has_and_belongs_to_many :tags, strict_loading: true
end
