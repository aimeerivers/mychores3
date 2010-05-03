class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :name
      t.string :email

      t.timestamps
    end

    remove_column :users, :name
    remove_column :users, :email
    add_column :users, :person_id, :integer
    add_index :users, :person_id, :unique => true, :null => false
  end

  def self.down
    drop_table :people

    add_column :users, :name, :string
    add_column :users, :email, :string
    remove_index :users, :person_id
    remove_column :users, :person_id
  end
end
