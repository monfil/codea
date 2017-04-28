require 'csv'

class Store
  def add_user(user)
    CSV.open("user.csv", "a+") do |csv|
      csv << [user.email, user.password, user.class.to_s.downcase]
    end
  end

  def login(email, password)
    user = [false]
    CSV.foreach("user.csv") do |row|
      if row[0] == email
        user[0] = row[0]
        if row[1] == password
          user = row
        else
          user << false
        end
      end
    end
    user
  end

  

end

class Product

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