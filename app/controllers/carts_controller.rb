class CartsController < BaseController
  
  def index
  end
  def show
  end
  
  def add
    @cart.add(params[:id])
    #variable used in add.js.erb
    @photo_id = params[:id]
    
    if request.xhr?
    elsif request.post?
      respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Successfully Added to cart.' }
      end

    else render
    end
  end

  def remove
    @cart.remove(params[:id])
    #variable used in add.js.erb
    @photo_id = params[:id]
    if request.xhr?
    elsif request.post?
      respond_to do |format|
        format.html { redirect_to photos_url, notice: 'Successfull removed from cart.' }
      end
    else render
    end
  end

  private
  def cart_params
  end
end

