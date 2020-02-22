class CipherText < ApplicationRecord
  belongs_to :user

  scope :latest, -> { order(created_at: :desc) }
end
