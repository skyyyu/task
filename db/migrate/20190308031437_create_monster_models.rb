class CreateMonsterModels < ActiveRecord::Migration[5.2]
  def change
    create_table :monster_models do |t|
      t.string :name
      t.integer :Offensive_power
      t.integer :Defense_power

      t.timestamps
    end
  end
end
