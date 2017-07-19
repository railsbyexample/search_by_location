# Item model
class Item < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :description, presence: true

  # Associations
  belongs_to :store
end
