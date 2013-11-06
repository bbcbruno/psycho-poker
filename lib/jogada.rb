require_relative 'carta'

class Jogada

	def self.evaluate(cartas)
		grupos = cartas.group_by(&:valorCarta).inject({}) do |temp, (key, value)| 
			temp[key] = value.size
			temp
		end

		case 
			when isSequence(cartas)
				cartas.group_by(&:naipe).size == 1 ? Resultado::STRAIGHT_FLUSH : Resultado::STRAIGHT
			when grupos.has_value?(4) then Resultado::FOUR_OF_A_KIND
			when grupos.has_value?(3) && grupos.has_value?(2) then Resultado::FULL_HOUSE
			when cartas.group_by(&:naipe).size == 1 then Resultado::FLUSH
			when grupos.has_value?(3) then Resultado::THREE_OF_A_KIND
			when grupos.select {|k,v| v == 2}.size == 2 then Resultado::TWO_PAIRS
			when grupos.select {|k,v| v == 2}.size == 1 then Resultado::PAIR
			else Resultado::HIGHEST_CARD
		end
	end

	def self.isSequence(cartas)
		temp = cartas.map(&:valorCarta).sort
		cartas.map(&:valor).sort.eql?(["2","3","4","5","A"]) || (temp.first..temp.last).to_a.eql?(temp)
	end

end

class Resultado

	 STRAIGHT_FLUSH = {9 => "straight-flush (sequência numérica e de naipe)"}
	 STRAIGHT = {8 => "straight (sequência numérica)"}
	 FOUR_OF_A_KIND= {7 => "four-of-a-kind (quadra)"}
	 FULL_HOUSE= {6 => "full-house (trinca + par)"}
	 FLUSH = {5 => "flush (sequência de naipe)"}
	 THREE_OF_A_KIND= {4 => "three-of-a-kind (trinca)"}
	 TWO_PAIRS= {3 => "two-pairs (2 pares)"}
	 PAIR = {2 => "one pair (1 par)"}
	 HIGHEST_CARD = {1 => "highest-card (maior carta)"}

	def self.get(jogo)
		@values[jogo]
	end	
end
