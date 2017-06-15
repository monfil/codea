class CreateFlights < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
    	# Completa con las columnas que necesites
      t.string :name
      t.string :email, unique: true
      t.string :password
      t.boolean :admin, default: false
      t.timestamps
    end

    create_table :flights do |t|
      # Completa con las columnas que necesites
      t.integer :num_flight
      t.date :date
      t.time :depart
      t.string :from
      t.string :to
      t.time :duration
      t.float :cost
      t.integer :passengers
      t.timestamps
    end


    #crea las tablas restantes

    create_table :bookings do |t|
      t.belongs_to :flight, index: true
      t.integer :num_booking
      t.float :total
      t.timestamps
    end

    create_table :user_flights do |t|
      t.belongs_to :user, index: true
      t.belongs_to :flight, index: true
      t.timestamps
    end

    create_table :user_bookings do |t|
      t.belongs_to :booking, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end

  end
end
