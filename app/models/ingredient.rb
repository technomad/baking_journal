class Ingredient < ActiveRecord::Base
  has_many :entry_ingredients
  has_many :entries, :through => :entry_ingredients
  
  def ingredient_name
    @name = self.name
    @ingredient = self.find_or_create_by_name(@name)
  end
  
end
