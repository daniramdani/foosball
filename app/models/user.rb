class User < ApplicationRecord
	has_and_belongs_to_many :teams
	validates :firstname, length: {minimum: 3}, presence: true
	validates :username, length: {minimum: 3}, uniqueness: true

	def user_one
    self.users.first.firstname
  end

  def team_player_two
    self.users.last.firstname unless self.users.first.firstname == self.users.last.firstname
  end
end
