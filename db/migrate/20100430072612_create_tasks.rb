class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.date :due_on
      t.integer :team_id

      t.timestamps
    end

    add_index :tasks, :team_id, :unique => false, :null => false
  end

  def self.down
    drop_table :tasks
  end
end
