require '../lib/jogada'
require 'test/unit'

class JogadaTest < Test::Unit::TestCase

	def testDeveSerSequencia
		cartas = [Carta.new("2H"), Carta.new("5C"), Carta.new("4D"), Carta.new("3C"), Carta.new("6S")]
		assert Jogada.isSequence cartas
	end

	def testNaoDeveSerSequencia
		cartas = [Carta.new("2C"), Carta.new("5H"), Carta.new("9S"), Carta.new("8C"), Carta.new("6C")]
		refute Jogada.isSequence cartas
	end

	def testDeveSerSequenciaSeIniciarComAsEFinalizarComQuatro
		cartas = [Carta.new("2H"), Carta.new("4C"), Carta.new("5D"), Carta.new("3C"), Carta.new("AS")]
		assert Jogada.isSequence cartas
	end

	def testDeveSerStraight
		cartas = [Carta.new("2H"), Carta.new("4C"), Carta.new("5D"), Carta.new("3C"), Carta.new("AS")]
		assert_equal Resultado::STRAIGHT, Jogada.evaluate(cartas)
	end

	def testDeveSerStraightFlush
		cartas = [Carta.new("2H"), Carta.new("4H"), Carta.new("5H"), Carta.new("3H"), Carta.new("AH")]
		assert_equal Resultado::STRAIGHT_FLUSH, Jogada.evaluate(cartas)
	end

	def testDeveSerFourOfAKind
		cartas = [Carta.new("7H"), Carta.new("7H"), Carta.new("7C"), Carta.new("7H"), Carta.new("AS")]
		assert_equal Resultado::FOUR_OF_A_KIND, Jogada.evaluate(cartas)
	end

	def testDeveSerFullHouse
		cartas = [Carta.new("7H"), Carta.new("7H"), Carta.new("JC"), Carta.new("JH"), Carta.new("JS")]
		assert_equal Resultado::FULL_HOUSE, Jogada.evaluate(cartas)
	end

	def testDeveSerFlush
		cartas = [Carta.new("3H"), Carta.new("7H"), Carta.new("5H"), Carta.new("JH"), Carta.new("AH")]
		assert_equal Resultado::FLUSH, Jogada.evaluate(cartas)
	end

	def testDeveSerThreeOfAKind
		cartas = [Carta.new("QH"), Carta.new("7C"), Carta.new("QH"), Carta.new("QH"), Carta.new("AS")]
		assert_equal Resultado::THREE_OF_A_KIND, Jogada.evaluate(cartas)
	end	

	def testDeveSerTwoPairs
		cartas = [Carta.new("QH"), Carta.new("QC"), Carta.new("KH"), Carta.new("9H"), Carta.new("KS")]
		assert_equal Resultado::TWO_PAIRS, Jogada.evaluate(cartas)
	end

	def testDeveSerPair
		cartas = [Carta.new("QH"), Carta.new("TC"), Carta.new("KH"), Carta.new("9H"), Carta.new("KS")]
		assert_equal Resultado::PAIR, Jogada.evaluate(cartas)
	end	

	def testDeveSerHighestCard
		cartas = [Carta.new("QH"), Carta.new("TC"), Carta.new("KH"), Carta.new("9H"), Carta.new("AS")]
		assert_equal Resultado::HIGHEST_CARD, Jogada.evaluate(cartas)
	end	

end