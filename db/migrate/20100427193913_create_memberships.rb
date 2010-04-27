class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships do |t|
      t.integer :team_id
      t.integer :user_id

      t.timestamps
    end
    add_index :memberships, :team_id, :unique => false, :null => false
    add_index :memberships, :user_id, :unique => false, :null => false
  end

  def self.down
    drop_table :memberships
  end
end
