class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :website
      t.string :country

      t.timestamps null: false
    end
  end
end
