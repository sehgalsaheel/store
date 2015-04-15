class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :price
      t.integer :category, default: 1

      t.timestamps null: false
    end
  end
end
