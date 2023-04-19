class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :matches
  has_many :genres
  has_many :bands
  has_many :songs
  has_many :lyrics
end
