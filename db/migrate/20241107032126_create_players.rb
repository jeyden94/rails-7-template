class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.references :game, null: false, foreign_key: true
      t.string :player_name, null: false
      t.integer :suspect_id # Assuming this references a Suspect table
      t.datetime :joined_at, default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamps
    end
  end
end
