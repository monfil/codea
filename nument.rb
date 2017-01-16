def user()
	v = ""
	c = 0
	while v != "Ya" do
		p "Dame un valor: "
		v = gets.chomp
		c +=1
	end
	p "Número de entradas del usuario: #{c}"
end

user()