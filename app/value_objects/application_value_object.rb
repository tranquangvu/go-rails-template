class ApplicationValueObject < ValueObjects::Base
  class Collection < Collection; end

  # Usage:
  #   Read more at: https://github.com/GoldenOwlAsia/value_objects
  #
  # class AddressValueObject < ApplicationValueObject
  #   attr_accessor :street, :postcode, :city
  #
  #   validates :postcode, presence: true
  #   validates :city, presence: true
  # end
  #
  # address = AddressValueObject.new(street: '123 Big Street', city: 'Metropolis')
  # address.valid? # => false
  # address.errors.to_h # => {:postcode=>"can't be blank"}
  # address.postcode = '12345' # => "12345"
  # address.valid? # => true
  # address.errors.to_h # => {}
  #
  # In ActiveRecord
  # class User < ActiveRecord::Base
  #   include ValueObjects::ActiveRecord
  #
  #   value_object :company_addresses, AddressValueObject::Collection
  #   value_object :home_address, AddressValueObject
  # end
end
