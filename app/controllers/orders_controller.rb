class OrdersController < BaseController

	def index
		@orders = current_user.orders
	end

	def new
		if @cart.photos.empty?
			flash[:notice] = "Your shopping cart is empty! ➥ Please add something to it before proceeding to orders."
			redirect_to photos_path and return
		end

		@order      = Order.new
		@page_title = "Checkout"

		if !@order.populate_order(@cart) || !@order.process
			flash[:notice] = "Error while placing orders.'#{@order.error_message}'"
			redirect_to carts_path
		else
			redirect_to new_order_address_path(@order)
		end


	end

	def create
		# @order 								=  Order.new(order_params)
		# @page_title 	   			=  "Checkout"
		# @order.customer_ip 		=  request.remote_ip
		# @order.populate_order
    #
		# if @order.process
		# 	flash[:notice] 		  = 'Your orders has been submitted, and will be processed immediately.'
		# 	session[:order_id] 	= @order.id
		# 	#ComppMailer.sample_email(User.first).deliver
    #
		# 	redirect_to orders_thank_you_path
		# else
		# 	flash[:notice] = "Error while placing orders.'#{@order.error_message}'"
		# 	render :new
		# end

end

	def show
		@page_title = "Displaying orders ##{params[:id]}"
		@order = Order.eager_load(:order_items, :addresses).find(params[:id])
		@order_items = @order.order_items
		@order_address = @order.addresses.first
	end

	def thank_you
		# Empty the cart
		@page_title = 'Thank You!'
	end

	def close
		order = Order.find(params[:id])
		order.close
		flash[:notice] = "Order #{order.id} has been closed"
		redirect_to :action => 'index', :id => 'closed'
	end

	private
	def order_params
		params.require(:order).permit(:email, :phone_number, :ship_to_first_name)
	end
end
