class CartItem < ActiveRecord::Base
	belongs_to :cart
	belongs_to :photo

	def total
		self.unit_price * self.qty
	end
end
