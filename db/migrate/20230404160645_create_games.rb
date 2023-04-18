class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :game_id, {index: true, null: false}
      t.string :status, {null: false}
      t.date :start_date, {null: false}
      t.string :who_moves, {null: false}
      t.string :fen, {null: false}
      t.references :player, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.date :end_date

      t.timestamps
    end
  end
end
