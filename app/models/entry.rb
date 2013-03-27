class Entry < ActiveRecord::Base
  belongs_to :user
  has_many :entry_ingredients
  has_many :ingredients, :through => :entry_ingredients
  has_many :steps
  
  before_save :default_name, :if => lambda { |e| e[:name].blank? }
  
  accepts_nested_attributes_for :entry_ingredients, :reject_if => lambda { |a| a[:quantity].blank? && a[:unit].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :steps, :reject_if => lambda { |s| s[:description].blank? }, :allow_destroy => true
  
  def default_name
      self.name = Time.new
  end
  
  #Calculate hydration percentage of dough
  #def calc_hydration
  
end
