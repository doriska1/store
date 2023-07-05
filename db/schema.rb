# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_705_115_301) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'items', force: :cascade do |t|
    t.string 'name'
    t.decimal 'price', precision: 6, scale: 2
    t.text 'text'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'tags', default: [], array: true
  end

  create_table 'items_tags', id: false, force: :cascade do |t|
    t.bigint 'item_id', null: false
    t.bigint 'tag_id', null: false
    t.index %w[item_id tag_id], name: 'index_items_tags_on_item_id_and_tag_id'
    t.index %w[tag_id item_id], name: 'index_items_tags_on_tag_id_and_item_id'
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_tags_on_name', unique: true
  end

  add_foreign_key 'items_tags', 'items'
  add_foreign_key 'items_tags', 'tags'
end
