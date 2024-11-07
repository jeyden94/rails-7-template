# == Schema Information
#
# Table name: players
#
#  id          :bigint           not null, primary key
#  is_bot      :boolean          default(FALSE)
#  joined_at   :datetime
#  player_name :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  game_id     :bigint           not null
#  suspect_id  :integer
#
# Indexes
#
#  index_players_on_game_id  (game_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_id => games.id)
#
class Player < ApplicationRecord
  belongs_to :game

  # Additional validations or methods can go here if needed
  validates :player_name, presence: true
end
