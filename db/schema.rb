# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130328234323) do

  create_table "entries", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "grains"
    t.boolean  "autolyse"
    t.boolean  "pre_ferment"
    t.decimal  "hydration",   :precision => 3, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["user_id"], :name => "index_entries_on_user_id"

  create_table "entry_ingredients", :force => true do |t|
    t.integer  "entry_id"
    t.integer  "ingredient_id"
    t.integer  "unit_id"
    t.decimal  "quantity",      :precision => 10, :scale => 2
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "entry_ingredients", ["entry_id", "ingredient_id"], :name => "index_entry_ingredients_on_entry_id_and_ingredient_id"
  add_index "entry_ingredients", ["ingredient_id"], :name => "entry_ingredients_ingredient_id_fk"
  add_index "entry_ingredients", ["unit_id"], :name => "entry_ingredients_unit_id_fk"

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steps", :force => true do |t|
    t.integer  "entry_id",    :null => false
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "steps", ["entry_id"], :name => "index_steps_on_entry_id"

  create_table "units", :force => true do |t|
    t.string   "name"
    t.string   "unit_of"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email",             :null => false
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "entries", "users", :name => "entries_user_id_fk", :dependent => :delete

  add_foreign_key "entry_ingredients", "entries", :name => "entry_ingredients_entry_id_fk", :dependent => :delete
  add_foreign_key "entry_ingredients", "ingredients", :name => "entry_ingredients_ingredient_id_fk", :dependent => :delete
  add_foreign_key "entry_ingredients", "units", :name => "entry_ingredients_unit_id_fk", :dependent => :delete

  add_foreign_key "steps", "entries", :name => "steps_entry_id_fk", :dependent => :delete

end
