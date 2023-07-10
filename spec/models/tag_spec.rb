# frozen_string_literal: true

# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tags_on_name  (name) UNIQUE

describe Tag, type: :model do
  describe 'column' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
  end

  describe 'associacion' do
    it { is_expected.to have_and_belong_to_many(:item) }
  end
end
