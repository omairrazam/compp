class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :initialize_cart
  private
  def initialize_cart

    if current_user.cart.nil?
      @cart = current_user.create_cart()
    else
      @cart = current_user.cart
    end
  end

end
