class BaseController < ApplicationController
	before_action :initialize_cart
	
	private
	def initialize_cart
		if !current_user.nil?
		  if current_user.cart.nil?
		    @cart = current_user.create_cart()
		  else
		    @cart = current_user.cart
		  end
		end
	end
end
