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

  def product_index
    product_array = []
    CSV.foreach("product.csv") do |row|
      product_array << Product.new(row[0], row[1])
    end
    product_array
  end

   def user_index
    user_array = []
    CSV.foreach("user.csv") do |row|
      user_array << User.new(row[0], row[1])
    end
    user_array
  end

  def write_csv(new_list, file)
    CSV.open(file, "wb") do |csv|
      new_list.each {|line| csv << line}
    end
  end

  def delete_product(id)
    description = false
    product_array = CSV.read("product.csv")
    product_array.each_with_index do |product, index|
      if index == (id - 1)
        product_array.delete_at(index)
        description = product[0]
      end
    end
    write_csv(product_array, "product.csv")
    description
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

  def delete_user
  end
  
end

class Seller < User

end

class Client < User

end