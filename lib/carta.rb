class Carta

	attr_reader :valor, :naipe

	def initialize(valor)
		@valor = valor[0]
		@naipe = valor[1]
	end

	def valorCarta
		case @valor
			when 'T' then 10
		    when 'J' then 11
		    when 'Q' then 12
		    when 'K' then 13
		    when 'A' then 14
		    else @valor.to_i
		 end
	end

	def to_s
		@valor + @naipe
	end
		
end
