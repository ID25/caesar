class AddCipherTextsReferencesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :cipher_texts, :user, index: true
  end
end
