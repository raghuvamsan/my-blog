class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of :email
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :omniauthable
	 
has_many :authentications, dependent: :destroy

has_one :address
accepts_nested_attributes_for :address

has_many :tasks

accepts_nested_attributes_for :tasks,
  :allow_destroy => true,
  :reject_if => :all_blank

has_many :interest_users
has_many :interest, :through => :interest_users

accepts_nested_attributes_for :interest_users, :allow_destroy => true

def apply_omniauth(auth)
  # In previous omniauth, 'user_info' was used in place of 'raw_info'
  if auth['provider'] != "twitter"
	self.email = auth['extra']['raw_info']['email']
  end
  # Again, saving token is optional. If you haven't created the column in authentications table, this will fail
  authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
end

end
