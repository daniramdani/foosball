class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.string :team_one
      t.string :team_two
      t.integer :team_one_score
      t.integer :team_two_score
      t.string :winning_team
      t.integer :game_amount

      t.timestamps
    end
  end
end
