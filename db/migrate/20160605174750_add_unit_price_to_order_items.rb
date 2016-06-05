class AddUnitPriceToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :unit_price, :float
  end
end
