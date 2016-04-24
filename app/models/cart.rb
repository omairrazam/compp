class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :photos, :through => :cart_items

  def total
    cart_items.inject(0) {|sum, n| n.unit_price * n.qty + sum}
  end

  def add(photo_id)
    photo = Photo.find(photo_id)
    photo.create_cart_item(:qty => 2,
                           :unit_price => 10)
    photo.cart = self
  end

  def remove(photo_id)
    photo = Photo.find(photo_id)
    photo.cart_item.destroy
  end
end
