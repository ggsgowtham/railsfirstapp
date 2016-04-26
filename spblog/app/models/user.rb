class User < ActiveRecord::Base
	has_many :articles
	validates :password, presence: true, length: {minimum: 8} ,
			  :confirmation => true, length: { minimum: 8}, :on => :create
	validates  :email , presence: true
			  
end
