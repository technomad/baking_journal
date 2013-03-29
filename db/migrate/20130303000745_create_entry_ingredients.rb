class CreateEntryIngredients < ActiveRecord::Migration
  def self.up
    create_table :entry_ingredients do |t|
      t.references :entry
      t.references :ingredient
      t.references :unit
      t.decimal :quantity, :precision => 10, :scale => 2

      t.timestamps
    end
    add_index :entry_ingredients, [:entry_id, :ingredient_id]
    
    add_foreign_key :entry_ingredients, :entries, :dependent => :delete
    add_foreign_key :entry_ingredients, :ingredients, :dependent => :delete
  end

  def self.down
    drop_table :entry_ingredients
  end
end
