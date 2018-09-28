class Category < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 32 }
  validates :code, :presence => true, :uniqueness => true, :length => { :maximum => 16 }
  validates :description, :length => { :maximum => 1024 } 

end
