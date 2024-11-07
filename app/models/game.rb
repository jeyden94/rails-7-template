# == Schema Information
#
# Table name:     game
#
#  id             :integer            not null, primary key
#  game_password  :string
#  game_status    :integer
#  created_at     :datetime           not null
#  updated_at     :datetime           not null
#
class Game < ApplicationRecord
  has_many :players, dependent: :destroy

  enum game_status: { pending: 0, active: 1, finished: 2 }

  before_create :generate_unique_key

  private

  def generate_unique_key
    loop do
      self.game_password = SecureRandom.alphanumeric(8).upcase
      break unless Game.exists?(game_password: self.game_password)
    end
  end
end
