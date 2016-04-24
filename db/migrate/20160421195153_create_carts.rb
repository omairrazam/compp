class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.timestamps null: false
    end

    add_reference :cart_items, :cart, index: true
  end
end
