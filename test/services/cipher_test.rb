require 'test_helper'

class CipherTest < ActiveSupport::TestCase
  test 'correct decrypted text' do
    shift = 3
    text = 'hello world'
    cipher = Cipher.new(text, shift)
    encrypted_text = 'khoor zruog'

    assert cipher.encrypt(text), encrypted_text
  end

  test 'correct encrypted text in other lang' do
    shift = 9
    text = 'привет мир'
    cipher = Cipher.new(text, shift)
    encrypted_text = 'чшркнъ фрш'

    assert cipher.decrypt(encrypted_text), text
  end
end
