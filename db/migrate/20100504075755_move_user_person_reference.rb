class MoveUserPersonReference < ActiveRecord::Migration
  def self.up
    remove_index :users, :person_id
    remove_column :users, :person_id

    add_column :people, :user_id, :integer
    add_index :people, :user_id, :unique => true, :null => false
  end

  def self.down
    add_column :users, :person_id, :integer
    add_index :users, :person_id, :unique => true, :null => false

    remove_index :people, :user_id
    remove_column :people, :user_id
  end
end
