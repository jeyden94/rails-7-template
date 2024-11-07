class AddMaxPlayersToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :max_players, :integer, default: 5
  end
end
