class Building < ActiveRecord::Base
	has_many :equipment
	has_many :groups

	validates :idAtlas, uniqueness: true, presence: true
end
