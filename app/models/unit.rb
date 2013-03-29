class Unit < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :entry_ingredient
  
end
