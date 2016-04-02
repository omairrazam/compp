class User < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	def cart_count
  		$redis.scard "cart#{id}"
	end
end
