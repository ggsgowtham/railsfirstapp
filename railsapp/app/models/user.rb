class User < ActiveRecord::Base
	attr_accessor :password
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  validates :userName, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :userId, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password  => true 
  validates_length_of :password, :in => 6..20, :on => :create
end
