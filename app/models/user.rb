class User < ActiveRecord::Base
  #acts_as_authentic
  has_many :entries, :dependent => :destroy
end
