require 'faker'
require 'csv'
require 'time'
require 'date'

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

  def initialize(file, people)
    @file = file
    @people = people
  end

  def create_csv
    CSV.open(@file, "wb") do |csv|
      @people.each {|person| csv << [person.first_name, person.last_name, person.email, person.phone, person.created_at]}
    end
  end
end

class PersonParser
  
  def initialize(file)
    @file = file
    @people_array = []
  end

  def people
    CSV.foreach(@file) do |row|
      @people_array << Person.new(row[0], row[1], row[2], row[3], row[4])
    end
    p @people_array[0..9]
  end

  def update_name(name, row)
    @people_array[row].first_name = name
    PersonWriter.new(@file, @people_array).create_csv
  end
end

#Driver code
people = Person.number_persons(20)
person_writer = PersonWriter.new("people.csv", people)
person_writer.create_csv
parser = PersonParser.new('people.csv')
people = parser.people
parser.update_name("Moanfeelz", 3)