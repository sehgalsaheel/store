class Vendor < ActiveRecord::Base
	validates :name, :presence => true
	validates :email, :uniqueness => true
 	validates_format_of :email, :with => /@/

 	default_scope { order("lower(name) asc")}
 	
 	has_many :items
end
