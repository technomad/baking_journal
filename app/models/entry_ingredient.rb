class EntryIngredient < ActiveRecord::Base
  belongs_to :entry
  belongs_to :ingredient

end
