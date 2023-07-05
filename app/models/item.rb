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
  accepts_nested_attributes_for :tags

  def tags_attributes=(tag_attributes)
    tag_attributes.each do |tag_attribute|
      tag = Tag.find_or_create_by(tag_attribute)
      self.tags << tag
    end
  end
end

