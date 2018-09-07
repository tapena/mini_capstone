class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :Name
      t.string :Email
      t.string :PhoneNumber

      t.timestamps
    end
    add_index :suppliers, :PhoneNumber
  end
end
