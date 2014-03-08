class InterestUser < ActiveRecord::Base
	belong_to :users
	belong_to :interest
end
