class Cone < ApplicationRecord
  has_many :links
  has_many :users, through: :links

  scope :random_avaible, -> { where() }
end
