require_relative 'jogada'

class Mao
	attr_accessor :cartas

	def initialize(cartas)
		@cartas = cartas
	end
end

class Monte
	attr_accessor :cartas

	def initialize(cartas)
		@cartas = cartas
	end
end

class Jogo

	def initialize(mao, monte)
		@mao = mao
		@monte = monte
	end

	def melhorJogada
		retorno = (0..@monte.cartas.size).inject([]) do |result, numCarta|
			result += @mao.cartas.combination(@mao.cartas.size - numCarta).to_a.map{ |cartas| Jogada.evaluate(cartas+@monte.cartas.take(numCarta))}
		end
		retorno.sort_by{|x| x.first[0]}.last.first[1]
	end

end