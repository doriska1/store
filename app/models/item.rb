# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  name       :string
#  price      :decimal(6, 2)
#  tags       :string           default([]), is an Array
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Item < ApplicationRecord
  validates :price, numericality: true, presence: true

  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags

  belongs_to :user, optional: true

  def tags=(tags_attributes)
    tags_attributes.each do |tag_attributes|
      tag = Tag.find_or_create_by(tag_attributes)
      tags << tag unless tags.include?(tag)
    end
  end
end
