class Photo < ActiveRecord::Base
  belongs_to :user
  has_one :cart_item, :dependent => :destroy
  has_attached_file :image, styles: { large:"900x590>",medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


  def cart_action(current_user_id)
    if $redis.sismember "cart#{current_user_id}", id
      "Remove from"
    else
      "Add to"
    end
  end

end
