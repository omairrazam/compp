class Photo < ActiveRecord::Base
  belongs_to :user
  has_one :cart_item, :dependent => :destroy
  has_one :cart, through: :cart_item
  has_many :order_item
  
  has_attached_file :image, styles: { large:"900x590>",medium: "300x300>", thumb: "100x100>", mini: "50*50>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
