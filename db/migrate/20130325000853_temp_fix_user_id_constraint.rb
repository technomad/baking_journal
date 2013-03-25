class TempFixUserIdConstraint < ActiveRecord::Migration
  def up
    change_column :entries, :user_id, :integer, :null => true
  end

  def down
    change_column :entries, :user_id, :integer, :null => false
  end
end
