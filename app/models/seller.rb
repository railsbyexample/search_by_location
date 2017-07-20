# Seller model
class Seller < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :description, presence: true

  # Associations
  has_many :stores, dependent: :destroy
end
