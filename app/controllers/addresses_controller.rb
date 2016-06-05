class AddressesController < BaseController

  def index
  end

  def new
    @order   =  Order.find(params[:order_id])
    @address =  @order.addresses.new
  end

  def create
    @order   =  Order.find(params[:order_id])
    @address =  @order.addresses.new(address_params)
    @order.status = OrderConstants::STATE_CONFIRM
    respond_to do |format|
      if @order.save
        @cart.cart_items.destroy_all
        format.html { redirect_to order_path(@order), notice: 'Your Order has been submitted' }
      else
        format.html { render :new }
      end
    end
  end

  private
  def address_params
    params.require(:address).permit(:email,
                                    :phone_number,
                                    :first_name,
                                    :last_name,
                                    :address,
                                    :city,
                                    :postal_code,
                                    :country
                                    )
  end
end
