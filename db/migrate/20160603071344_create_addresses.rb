class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      # Contact Information
      t.column :email, :string
      t.column :phone_number, :string
      # Shipping Address
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :address, :string
      t.column :city, :string
      t.column :postal_code, :string
      t.column :country, :string
      t.timestamps null: false
    end

    create_table :addresses_orders, id: false do |t|
      t.belongs_to :orders, index: true
      t.belongs_to :address, index: true
    end
  end
end




