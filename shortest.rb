def shortest(*arr)
	resa =[]
	begin 
		res = arr.min {|a,b| a.length <=> b.length}
		resa  << res
		if resa[0].length != resa.last.length
			resa.delete (res)
			break
		end
		arr.delete(res)
	end while resa[0].length == res.length
	p resa
end

p shortest("uno", "dos", "tres", "cuatro", "cinco") == ["uno", "dos"]
p shortest("gato", "perro", "elefante", "jirafa") == ["gato"]
p shortest("verde", "rojo", "negro", "morado") == ["rojo"]