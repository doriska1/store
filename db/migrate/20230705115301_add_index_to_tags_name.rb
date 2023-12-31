# frozen_string_literal: true

class AddIndexToTagsName < ActiveRecord::Migration[7.0]
  def change
    add_index :tags, :name, unique: true
  end
end
