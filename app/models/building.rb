class Building < ActiveRecord::Base
	has_many :equipment
	has_many :group

	validates :idAtlas, uniqueness: true, presence: true
end
