class Card
  attr_reader :value, :suit
  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def face_card?
    ['J','Q','K'].include?(value)
  end

  def ace?
    value == 'A'
  end

  def info
    "#{value}#{suit}"
  end

end
