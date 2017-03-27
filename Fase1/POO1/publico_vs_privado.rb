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
		print "#{name} <email: #{email}> acct: #{hide_numbers(deposit_account)}"
	end

	private

	def hide_numbers(deposit_account)
		deposit_account.gsub(/\d{5}/, "*****")
	end
end

# Driver code
employee = Employee.new('Juan Perez', 'juan@gmail.com', 1_800, '123-456-512')

employee.to_s
# => "Juan Perez <email: juan@gmail.com> acct: *****6512"