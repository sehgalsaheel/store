class Item < ActiveRecord::Base
	validates :name, :category, :presence=>true
	validates :price, :presence => true,
            :numericality => true,
            :format => { :with => /\A\d{1,4}(\.\d{0,2})?\z/ } 
	validates :thumbnail, allow_blank: true, format: {with:
		%r{\.(gif|jpg|png)\Z}i,
		message: 'must be a URL for GIF, JPG or PNG image.'}
	enum category: [:tanks, :battery, :juice, :mods]
	enum sort: [:item, :category, :vendor]

	belongs_to :vendor
end
