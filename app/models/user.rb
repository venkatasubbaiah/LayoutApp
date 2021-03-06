class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_one :profile
  has_many :authentications, :dependent => :delete_all
  has_many :friends ,:dependent => :delete_all

  def apply_omniauth(auth)
    self.email = auth['extra']['raw_info']['email']
    authentications.build(:provider => auth['provider'],
                          :uid => auth['uid'],
                          :token => auth['credentials']['token'])
    build_profile(:first_name =>auth['extra']['raw_info']['first_name'],
                  :last_name => auth['extra']['raw_info']['last_name'],
    :date_of_birth =>auth['extra']['raw_info']['birthday'])
  end

  after_create :send_welcome_email

  private

  def send_welcome_email
    SignupNotifier.signedup(self).deliver
  end


end
