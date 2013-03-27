class CreateSteps < ActiveRecord::Migration
  def self.up
    create_table :steps do |t|
      t.references :entry, :null => false
      t.text :description

      t.timestamps
    end
    add_index :steps, :entry_id
    
    add_foreign_key :steps, :entries, :dependent => :delete
  end
  
  def self.down
    drop_table :steps
  end
end
