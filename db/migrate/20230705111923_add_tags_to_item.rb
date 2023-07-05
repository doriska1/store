class AddTagsToItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :tags, :string, array: true, default: []
  end
end
