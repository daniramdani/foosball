class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :player_one
      t.string :player_two
      t.integer :wins, default: 0
      t.float :win_percentage, default: 0.0

      t.timestamps
    end
  end
end
