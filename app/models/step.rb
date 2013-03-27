class Step < ActiveRecord::Base
  #has_many :images
  belongs_to :entry
  attr_accessible :description, :entry_id


end
