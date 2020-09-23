class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :government, :boolean, default: false
    add_column :users, :address, :string
    add_column :users, :name, :string
    add_column :users, :ni, :string
  end
end
