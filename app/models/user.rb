class User < ActiveRecord::Base
  include BCrypt
  validates :email, presence: true, uniqueness: true
  validates :hashed_password, presence: true
 	
 	def password
 		@password ||= Password.new(hashed_password)
 	end
 	
 	def password=(new_password)
 	    @password = Password.create(new_password)
 	    self.hashed_password = @password
 	end

 	def self.authenticate(email, password)
 	   user = User.find_by(email: email)
 	   if user.password == password
 	     return user
 	   else
 	     nil
 	   end
 	end
end
