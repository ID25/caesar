class User < ApplicationRecord
  has_secure_password

  has_many :cipher_texts, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
