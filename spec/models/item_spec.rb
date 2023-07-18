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

describe Item, type: :model do
  describe 'column' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:price).of_type(:decimal) }
    it { is_expected.to have_db_column(:text).of_type(:text) }
    it { is_expected.to have_db_column(:tags).of_type(:string) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_numericality_of(:price) }
  end

  describe 'associacion' do
    it { is_expected.to have_and_belong_to_many(:tags) }
    it { is_expected.to accept_nested_attributes_for(:tags) }
  end

  describe 'tagging' do
    it 'set tags attributes after creating new item' do
      item = described_class.new(name: 'T-shirt', price: 100.0, tags: [{ name: 'tag1' }])
      expect(item.tags).to eq [Tag.last]
    end
  end
end
