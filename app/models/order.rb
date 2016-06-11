class Order < ActiveRecord::Base
	#attr_protected :id, :customer_ip, :status, :error_message, :updated_at, :created_at
	has_many :order_items
	has_many :photos, :through => :order_items
  has_and_belongs_to_many :addresses

	def total
    	order_items.inject(0) {|sum, n| n.unit_price * n.amount + sum}
	end

	def process
	    result = true
	    #
	    # TODO Charge the customer by calling the payment gateway
	    #

	    self.status = OrderConstants::STATE_CART
	    save!
	    result
	end

	def closed?
    	status == 'closed'
	end

	def close
        status = 'closed'
        save!
	end

	def populate_order(cart)
		for cart_item in cart.cart_items
			order_item = OrderItem.new(
					:photo_id   => cart_item.photo_id,
					:price 	    => cart_item.item_tot_price,
					:amount     => cart_item.qty,
					:unit_price => cart_item.unit_price
			)
			self.order_items << order_item
			true
		end
	end


end
