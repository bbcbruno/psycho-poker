require_relative 'jogada'
require_relative 'jogo'

class Parser
	def self.parse(fileName)
		linhas = File.open(fileName,"r").map{|linha| /^([2-9ATQJK][CSDH](\s)?){10}$/ =~ linha ? linha : (raise "Entrada errada!!!")}
		linhas.each do |linha| 
			mao = Mao.new(linha.split.first(5).map{|value| Carta.new(value)})
			monte = Monte.new(linha.split.last(5).map{|value| Carta.new(value)})
			puts Jogo.new(mao, monte).melhorJogada
		end
	end
end


Parser.parse("../entrada.txt")
