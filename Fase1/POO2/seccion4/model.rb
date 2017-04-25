require 'csv'

class Store

end

class Product

end

class User
  
  def initialize(email, password, type)
    @email = email
    @password = password
    @type = type
  end

  def login
  end

  def register
  end
end

class Admin < User

end

class Seller < User

end

class Client < User

  def initialize
  end 
end