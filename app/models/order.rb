class Order < ActiveRecord::Base
	#attr_protected :id, :customer_ip, :status, :error_message, :updated_at, :created_at
	has_many :order_items
  	has_many :photos, :through => :order_items

  	def total
    	order_items.inject(0) {|sum, n| 1 * n.amount + sum}
	end

	def process
	    result = true
	    #
	    # TODO Charge the customer by calling the payment gateway
	    #
	    self.status = 'processed'
	    save!
	    result
	end

	def closed?
    	status == 'closed'
	end

	def close
        self.status = 'closed'
        save!
	end
end
