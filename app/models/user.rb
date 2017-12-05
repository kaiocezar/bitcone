class User < ApplicationRecord
  has_many :links
  has_many :cones, through: :links

  monetize :balance_cents

  scope :by_whallet_hash, ->(hash) { where(wallet_hash: hash) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
