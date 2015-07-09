class CreateMatchPlayers < ActiveRecord::Migration
  def change
    create_table :match_players do |t|
      t.belongs_to :match, index: true, foreign_key: true
      t.belongs_to :player, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
