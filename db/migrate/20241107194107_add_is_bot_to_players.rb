class AddIsBotToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :is_bot, :boolean, default: false
  end
end
