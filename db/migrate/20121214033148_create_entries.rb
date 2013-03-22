class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.references :user, :null => false
      t.string :name
      t.string :grains
      t.boolean :autolyse
      t.boolean :pre_ferment
      t.decimal :hydration, :precision => 3, :scale => 2

      t.timestamps
    end
    add_index :entries, :user_id
    
    add_foreign_key :entries, :users, :dependent => :delete
  end

  def self.down
    drop_table :entries
  end
end
