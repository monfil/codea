require 'csv'

class Store
  def add_user(user)
    CSV.open("user.csv", "a+") do |csv|
      csv << [user.email, user.password, user.class.to_s.downcase]
    end
  end

  def login(email, password)
    CSV.foreach("user.csv") do |row|
      if row[0] == email && row[1] == password
        type = row[2]
        case type
        when "admin"
          return Admin.new(row[0], row[1])
        when "seller"
          return Seller.new(row[0], row[1])
        when "client"
          return Client.new(row[0], row[1])
        end
      end
    end
    nil
  end

  def add_product(product)
    CSV.open("product.csv", "a+") do |csv|
      csv << [product.description, product.price]
    end
  end
end

class Product
  attr_accessor :description, :price

  def initialize(description, price)
    @description = description
    @price = price
  end
end

class User
  attr_accessor :email, :password
  
  def initialize(email, password)
    @email = email
    @password = password
  end
end

class Admin < User
  
end

class Seller < User

end

class Client < User

end