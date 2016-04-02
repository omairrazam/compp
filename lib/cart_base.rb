module Cart

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