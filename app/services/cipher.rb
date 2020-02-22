class Cipher
  ENG = ('a'..'z').freeze
  RUS = ('а'..'я').freeze

  def initialize(text, shift)
    alphabet = detect_lang(text).to_a.join
    i = shift.to_i % alphabet.size
    @decrypt = alphabet
    @encrypt = alphabet[i..-1] + alphabet[0...i]
  end

  def encrypt(string)
    string.tr(@decrypt, @encrypt)
  end

  def decrypt(string)
    string.tr(@encrypt, @decrypt)
  end

  private

  def detect_lang(text)
    [ENG, RUS].find { |lang| text.split('').any? { |char| lang.include?(char) } }
  end
end
