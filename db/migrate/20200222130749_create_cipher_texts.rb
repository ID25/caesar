class CreateCipherTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :cipher_texts do |t|
      t.string :text, default: '', null: false
      t.integer :shift, null: false

      t.timestamps
    end
  end
end
