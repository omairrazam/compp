class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.belongs_to :photo, index: true
      t.integer :qty
      t.float :unit_price
      t.float :item_tot_price
      t.timestamps null: false
    end
  end
end
