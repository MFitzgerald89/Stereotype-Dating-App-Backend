class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :matches
  has_many :genres
  has_many :bands
  has_many :songs
  has_many :lyrics

  def user_matches
    people_i_like = []
    people_who_like_me = []

    matches.each do |match|
      people_i_like << match.match_id
    end

    my_matches = Match.where(match_id: id)

    my_matches.each do |my_match|
      people_who_like_me << my_match.user_id
    end

    intersect = people_i_like & people_who_like_me

    liked_also = User.where(id: intersect)

    return liked_also

  end

end
