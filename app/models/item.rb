class Item < ActiveRecord::Base
	validates :name, :category, :presence=>true
	validates :price, :presence => true,
            :numericality => true,
            :format => { :with => /\A\d{1,4}(\.\d{0,2})?\z/ } 
	enum category: ['Accessories', 'Battery', 'Juice', 'Mods', 'Starter Kits', 'Tanks / Attys']

	default_scope { order("lower(name) asc")}


	belongs_to :vendor
end
