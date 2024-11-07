class AddTotalBotsToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :total_bots, :integer, default: 0
  end
end
