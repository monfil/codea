# Este archivo sirve para correr código que te permita 
# rellenar tu base de datos con información. 

module WordSeeds
  def self.import(filename=File.dirname(__FILE__) + "/../words")
    Word.transaction do
      File.open(filename).each do |line|
        palabra = line.chomp
        canonica = line.chomp.chars.sort(&:casecmp).join
        user = Word.create!(word: palabra, canonical: canonica)
      end
    end
  end
end

WordSeeds.import