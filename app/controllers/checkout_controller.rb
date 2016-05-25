class CheckoutController < ApplicationController
  	before_filter :initialize_cart
  	
	def index
	    @order = Order.new
	    @page_title = "Checkout"

	    if @cart.photos.empty?
			flash[:notice] = "Your shopping cart is empty! ➥ Please add something to it before proceeding to checkout."
	      	redirect_to :controller => 'photos'
	    end
	end

	def show
        @page_title = "Displaying order ##{params[:id]}"
        @order = Order.find(params[:id])
	end
	
	def place_order
		@order = Order.new(order_params)
		@page_title 	   = "Checkout"
	    @order.customer_ip = request.remote_ip
	    populate_order

	    if @order.save
      		if @order.process
			flash[:notice] 		= 'Your order has been submitted, and will be processed immediately.'
	        session[:order_id] 	= @order.id
	       
	        # Empty the cart
	        @cart.cart_items.destroy_all
	        redirect_to :action => 'thank_you'
			else
				flash[:notice] = "Error while placing order.'#{@order.error_message}'"
		        render :action => 'index'
			end 
		else
	      render :action => 'index'
	    end
	end

	def thank_you
		@page_title = 'Thank You!'
	end

	def close
		order = Order.find(params[:id])
		order.close
		flash[:notice] = "Order #{order.id} has been closed" 
		redirect_to :action => 'index', :id => 'closed'
	end
	
	private
	def populate_order
	    for cart_item in @cart.cart_items
	  		order_item = OrderItem.new(
								        :photo_id => cart_item.photo_id,
								        :price 	  => cart_item.item_tot_price,
								        :amount   => cart_item.qty
									  )
	  		@order.order_items << order_item
	    end
	end

	def order_params
		params.require(:order).permit(:email, :phone_number, :ship_to_first_name)
    end
end
