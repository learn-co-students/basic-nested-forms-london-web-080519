class Person < ActiveRecord::Base
  has_many :addresses
  accepts_nested_attributes_for :addresses

  def address_attributes=(address)
    self.address = Address.find_or_create_by(street_address_1: address[:street_address_1])
    self.address.update(address)
  end
end
