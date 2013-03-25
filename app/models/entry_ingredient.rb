class EntryIngredient < ActiveRecord::Base
  belongs_to :entry
  belongs_to :ingredient

  accepts_nested_attributes_for :ingredient, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

end
