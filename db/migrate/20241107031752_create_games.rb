class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :game_password, null: false
      t.integer :game_status, default: 0
      t.timestamps
    end

    add_index :games, :game_password, unique: true
  end
end
