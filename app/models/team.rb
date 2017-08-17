class Team < ApplicationRecord
	before_save :set_team_wins
	has_and_belongs_to_many :matches, -> { uniq }
	has_and_belongs_to_many :users, -> { uniq }

  validates :player_one, presence: true
  validates :player_one, uniqueness: { scope: :player_two }
  validates :player_two, uniqueness: { scope: :player_one }

  def set_team_wins
    if self.wins != nil
      self.wins = 0 if self.wins < 0
      self.wins = 0 if self.wins < 0
    end
  end

  def matches_played
    self.matches.count
  end

  def matches_lost
    matches_played - self.wins.to_i
  end

  def team_win_percentage
  	mp_count = matches_played
  	mp_count == 0 ? ret = 0 : ret = ((self.wins.to_f / mp_count) * 100).round(2)
  	ret
  end

  def self.sorted_by_percentage_correct
    Team.all.sort_by(&:team_win_percentage).reverse
  end

  def team_player_one
    self.users.first.firstname
  end

  def team_player_two
    self.users.last.firstname unless self.users.first.firstname == self.users.last.firstname
  end
end
