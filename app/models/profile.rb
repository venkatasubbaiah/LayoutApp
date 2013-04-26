class Profile < ActiveRecord::Base
  attr_accessible :first_name, :last_name,:date_of_birth,:profile_image

  validates :first_name , :presence => true,:length => { :minimum => 4 }
  validates :last_name , :presence => true
  validates_date :date_of_birth, :before => lambda { 18.years.ago },
                 :before_message => "must be at least 18 years old"

  has_attached_file :profile_image,
                    :default_url => "/assets/default.ico",
                    :styles => { :medium => "300x300>", :thumb => "16x16>"}
end
