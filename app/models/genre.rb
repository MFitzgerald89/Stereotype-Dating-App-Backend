class Genre < ApplicationRecord
  has_many :bands
  belongs_to :user
end
