suma_uno = 4 + 7
suma_dos = suma_uno + 8
suma_dos == 19
#=> true
resta_uno = 3 -2
valor = "uno"
resta_dos = resta_uno - valor
resta_dos == 0
#=> No es posible crear la variable resta_dos, ya que los tipos al momento de definirla no son iguales y no se puede realizar la operación.

multiplicacion = 6 * 5
division = multiplicacion / 5
operacion = division - 3
cadena = "Hola" * operacion
cadena == "HolaHolaHolaHola"
#=> El resultado es false, ya que la variable cadena contiene "HolaHolaHola".
