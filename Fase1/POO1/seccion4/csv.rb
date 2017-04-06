require 'faker'
require 'csv'
require 'time'

class Person

	attr_accessor :first_name, :last_name, :email, :phone, :created_at
	
	def initialize(name, last_name, email, phone, time)
		@first_name = name
		@last_name = last_name
		@email = email
		@phone = phone
		@created_at = time
	end

	def self.number_persons(number)

		attr_accessor :array_people

		@array_people = []

		number.times do
			@array_people << Person.new(
				Faker::Name.first_name, 
				Faker::Name.last_name, 
				Faker::Internet.email, 
				Faker::PhoneNumber.phone_number,
				Time.now)
		end
		@array_people
	end
end

class PersonWriter

	def create_csv
	end
end

#Driver code
p people = Person.number_persons(3)