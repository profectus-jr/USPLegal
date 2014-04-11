class Group < ActiveRecord::Base
  has_many :inspections
  belongs_to :building

end
