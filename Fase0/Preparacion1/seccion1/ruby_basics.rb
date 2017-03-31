 #Ejercicio variables y constantes
title = ""
description = ""
num_of_likes = 0
CONSTANT = 25
street = "Cañitas"
number = "49"
state = "CDMX"
city = "Miguel Hidalgo"
zip = "11400"

puts street, number

#Ejercicio - Operaciones Aritméticas Básicas

num1 = 54
num2 = 87
sum = num1 + num2
difference = num1 - num2
product = num1 * num2
quotient = num1.to_f / num2
modulus = num1 % num2

puts sum, difference, product, quotient, modulus

#Ejercicio - Verdadeo o Falso

igual_que = 50 == 50
igual_que = true

menor_que = 23 < 30
menor_que = true

mayor_que = 54 > 40
mayor_que = true

menor_o_igual_que = 45 <= 45
menor_o_igual_que = true

mayor_o_igual_que = 56 >= 45
mayor_o_igual_que = true

diferente_que = 34 != 34
diferente_que = false

edad = 4
sexo = "hombre"

if edad >= 70 && sexo == "hombre"
  puts "Hombre Adulto Mayor"
else
  puts "Bebecino"
end

a = 50
b = 30
puts "b es mayor que a" if a < b && b > a

# Ejercicio - Operadores lógicos

valor_1 = (1 < 7 || false) && (true || true)
valor_1 = true
valor_2 = !false && (!false || 50 != 5**10)
valor_2 = true
valor_3 = false || !(true || true)
valor_3 = false 
