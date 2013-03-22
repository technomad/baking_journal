class Ingredient < ActiveRecord::Base
  has_many :entry_ingredients
  has_many :entries, :through => :entry_ingredients
  
  accepts_nested_attributes_for :entry_ingredients, :reject_if => lambda { |a| a[:quantity].blank? || a[:unit].blank? }, :allow_destroy => true
end
