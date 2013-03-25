class Ingredient < ActiveRecord::Base
  has_many :entry_ingredients
  has_many :entries, :through => :entry_ingredients
  
end
