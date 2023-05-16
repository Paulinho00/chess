class FixRelantionship < ActiveRecord::Migration[7.0]
  def change
    drop_table :games
    change_column :players, :player_id, :integer

    create_table :games do |t|
        t.string :game_id, index: true, null: false
        t.string :status, null: false
        t.date :start_date, null: false
        t.string :who_moves, null: false
        t.string :fen, null: false
        t.date :end_date

        t.timestamps
      end

    add_column :games, :player_white_id, :integer, null: false
    add_column :games, :player_black_id, :integer, null: false
    change_column :games, :game_id, :integer
    add_foreign_key :games, :players, column: :player_white_id
    add_foreign_key :games, :players, column: :player_black_id
  end
end
