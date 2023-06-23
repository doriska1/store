class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price, precision: 6, scale: 2
      t.text :text

      t.timestamps
    end
  end
end
