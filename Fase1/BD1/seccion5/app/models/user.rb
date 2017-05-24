class User < ActiveRecord::Base
# Implementa los métodos y validaciones de tu modelo aquí. 
  def name
    "#{first_name} #{last_name}"
  end

  def age
    today = Date.today
    today.year - birthday.year - ((today.month > birthday.month || (today.month == birthday.month && today.day >= birthday.day)) ? 0 : 1)
  end

  validates :email, :uniqueness => true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :age, numericality: { greater_than_or_equal_to: 18 }
  validates :phone, :format => { :with => /(\d{3}).+(\d{3}).(\d{4})/ }
end
