require 'cart_base'
class CartsController < ApplicationController
  before_action :authenticate_user!
  include Cart
  def show
    photo_ids = $redis.smembers current_user_cart
    @cart_photos = Photo.includes(:cart_item).find(photo_ids)
  end

  def add
    cart_item             = CartItem.new
    cart_item.qty         = Setting::DEFAULT_QUANTITY
    cart_item.photo_id    = params[:photo_id]
    cart_item.unit_price  = Setting::UNIT_PRICE
    cart_item.item_tot_price = Setting::UNIT_PRICE * Setting::DEFAULT_QUANTITY
    cart_item.save

    $redis.sadd current_user_cart, params[:photo_id]
    render json: current_user.cart_count, status: 200
  end

  def remove
    remove_from_cart(params[:photo_id])
    render json: current_user.cart_count, status: 200
  end

  def remove_from_cart(photo_id)
    photo     = Photo.find(photo_id)
    cart_item = photo.cart_item
    cart_item.destroy

    $redis.srem current_user_cart, photo_id

  end

  def current_user_cart
    "cart#{current_user.id}"
  end
end

