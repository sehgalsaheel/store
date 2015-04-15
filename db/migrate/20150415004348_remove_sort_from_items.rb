class RemoveSortFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :sort, :integer
  end
end
