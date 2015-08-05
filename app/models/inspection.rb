class Inspection < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  belongs_to :equipment
  has_many :answers

  delegate :equip_type, :to => :equipment 

	mount_uploader :photo_url, PictureUploader
end
