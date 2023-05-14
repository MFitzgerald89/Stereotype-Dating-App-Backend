class Band < ApplicationRecord
  has_many :genres
  has_many :songs
end
