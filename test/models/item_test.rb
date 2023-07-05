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
#
require "test_helper"

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
