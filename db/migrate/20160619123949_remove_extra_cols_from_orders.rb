class RemoveExtraColsFromOrders < ActiveRecord::Migration
  def change

    remove_column :orders, :phone_number, :string
    remove_column :orders, :ship_to_first_name, :string
    remove_column :orders, :ship_to_last_name, :string
    remove_column :orders, :ship_to_address, :string
    remove_column :orders, :ship_to_city, :string
    remove_column :orders, :ship_to_postal_code, :string
    remove_column :orders, :ship_to_country, :string
  end
end
