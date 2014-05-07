class Equipment < ActiveRecord::Base
	has_many :inspections, :dependent => :delete_all
	belongs_to :equip_type
	belongs_to :building

	validates :is_there, :inclusion => {:in => [true, false]}
  
  
end
