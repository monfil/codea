class Employee
	attr_writer :email, :salary
	attr_reader :name, :deposit_account

	def initialize(name, email, salary, deposit_account)
		@name = name
		@email = email
		@salary = salary
		@deposit_account = deposit_account
	end

	def to_s
		p "#{@name} <email: #{@email}> acct: #{hide_numbers(@deposit_account)}"
	end

	 def vacation_days
    coefficient * 7  
  end

  def bonus
    coefficient * 1000
  end

	private

	def hide_numbers(deposit_account)
		deposit_account.delete('-').gsub(/(\d{5})(\d{4})/, '*****\2')
	end

	  def coefficient
    coefficients = { 1 => 0...1_000, 1.2 => 1_000...2_000, 1.4 => 2_000...5_000, 1.5 => 5_000..10_000 }

    coefficients.find { |coefficient, range| range.include? @salary }.first
  end
end

# Driver code
employee = Employee.new('Juan Perez', 'juan@gmail.com', 1_800, '123-456-512')

employee.to_s
# => "Juan Perez <email: juan@gmail.com> acct: *****6512"

str = "The employee information is #{employee}"
puts str

puts employee.vacation_days == 8.4
puts employee.bonus == 1_200