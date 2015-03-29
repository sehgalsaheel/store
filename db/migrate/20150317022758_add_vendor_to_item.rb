class AddVendorToItem < ActiveRecord::Migration
  def change
    add_reference :items, :vendor, index: true
    add_foreign_key :items, :vendors
  end
end
