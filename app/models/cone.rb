class Cone < ApplicationRecord
  has_many :links
  has_many :users, through: :links

  monetize :price_cents

  scope :random_available, -> { where() }
end
