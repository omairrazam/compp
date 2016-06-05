class Admin::OrdersController < Admin::BaseController
	
	def index
	    @status = params[:id]
	    if @status.blank?
	      @status = 'all'
	      conditions = nil
	    else
	      conditions = "status = '#{@status}'"
	    end
	    @page_title = "Listing #{@status} orders"
		@orders = Order.all
		
	end

	def show
		@page_title = "Displaying orders ##{params[:id]}"
        @order = Order.find(params[:id])
	end

	def close
	end
end
