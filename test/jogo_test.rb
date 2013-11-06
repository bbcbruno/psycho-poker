require '../lib/jogo'
require '../lib/carta'
require 'test/unit'

class JogoTest < Test::Unit::TestCase

	def testDeveSerMelhorJogadaComStraightFlush
		
		mao = Mao.new([Carta.new("TH"), Carta.new("JH"), Carta.new("QC"), Carta.new("QD"), Carta.new("QS")])
		monte = Monte.new([Carta.new("QH"), Carta.new("KH"), Carta.new("AH"), Carta.new("2S"), Carta.new("6S")])
		
		assert_equal Resultado::STRAIGHT_FLUSH, Jogo.new(mao, monte).melhorJogada
	end

end