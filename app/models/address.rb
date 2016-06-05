class Address < ActiveRecord::Base
  has_and_belongs_to_many :orders

  validates :address, presence: true, length: { minimum: 5 }
  validates :first_name, presence: true,length: { minimum: 3 }
  validates :last_name, presence: true, length: { minimum: 3 }
  validates :phone_number, presence: true, length: { minimum: 5 }, :numericality => true


  def name
    self.first_name + ' ' + self.last_name
  end

  def city_country_code
    if self.city.nil?
      self.city = ''
    end
    if self.country.nil?
      self.country = ''
    end

    if self.postal_code.nil?
      self.postal_code = ''
    end

    self.city + ',' + self.country + ' ' + self.postal_code

  end
end
