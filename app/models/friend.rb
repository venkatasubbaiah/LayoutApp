class Friend < ActiveRecord::Base
  attr_accessible :name, :facebook_uid
  belongs_to :user
end
