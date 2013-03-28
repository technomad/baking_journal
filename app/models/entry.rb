class Entry < ActiveRecord::Base
  belongs_to :user
  has_many :entry_ingredients
  has_many :ingredients, :through => :entry_ingredients
  has_many :steps
  
  before_save :default_name, :if => lambda { |e| e[:name].blank? }
  
  accepts_nested_attributes_for :entry_ingredients, :allow_destroy => true
  accepts_nested_attributes_for :steps, :reject_if => lambda { |s| s[:description].blank? }, :allow_destroy => true
  
  def default_name
      self.name = Time.new
  end
  
  #calculate bakers percentage of entry
  def calc_bakers_percentages
    #flour is the base, always 100%
    #other ingredients will be calculated as a percentage of the flour weight
    #bakers percent(ingredient) = 100% *ingredient_mass/flour_mass
    #    
    for e in self.ingredients
      if e.name == "flour"
      end
    end
  end
  
  #Calculate hydration percentage of dough  
  def calc_hydration
    #Percentage of water to flour
    
    #TODO sum percentage of all liquids in bakers percentage, if the bakers percentage calc fails, use only the flour and liquids

  end
  
end
