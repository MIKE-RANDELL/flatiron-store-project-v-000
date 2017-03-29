class AddCheckedOutToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :checked_out, :boolean, :default => false
  end
end
