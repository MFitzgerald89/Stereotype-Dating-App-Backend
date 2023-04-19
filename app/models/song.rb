class Song < ApplicationRecord
  belongs_to :band
  has_many :lyrics
end
