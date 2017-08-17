class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :username

      t.timestamps null: false
    end
  end
end
