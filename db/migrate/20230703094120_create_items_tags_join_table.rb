# frozen_string_literal: true

class CreateItemsTagsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :items, :tags, column_options: { null: false, foreign_key: true } do |t|
      t.index %i[item_id tag_id]
      t.index %i[tag_id item_id]
    end
  end
end
