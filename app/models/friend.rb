class Friend < ActiveRecord::Base
  attr_accessible :name, :facebook_uid, :user_id, :city, :longitude, :latitude

  belongs_to :user

  geocoded_by :city

  after_validation :geocode
  validates :facebook_uid, :uniqueness => { :scope => :user_id  }
end
