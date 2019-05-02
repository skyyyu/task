class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :deadline
      t.text :detail
      t.integer :time
      t.integer :state, default:0
      t.timestamps null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
