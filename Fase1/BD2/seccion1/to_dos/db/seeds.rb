# Este archivo sirve para crear registros de prueba
require 'csv'
CSV.foreach("tasks.csv") do |row|
  if row[0]!=nil
    Task.create(task:row[0])
  end
end