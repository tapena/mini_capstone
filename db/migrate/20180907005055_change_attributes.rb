class ChangeAttributes < ActiveRecord::Migration[5.2]
  def change
    rename_column :suppliers, :Email, :email
    rename_column :suppliers, :Name, :name
    rename_column :suppliers, :PhoneNumber, :phone_number
  end
end
