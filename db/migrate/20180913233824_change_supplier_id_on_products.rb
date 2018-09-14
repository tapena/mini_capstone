class ChangeSupplierIdOnProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :supploer_id, :supplier_id
  end
end
