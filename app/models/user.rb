class User < ApplicationRecord
  #creates salted hash based onthe password
  #provide an authenticate method to check if password in login form is a match


   has_secure_password

   validates :email, presence: true, uniqueness: true
   validates :password, presence: true

    def self.confirm(email, password)
      user = User.find_by(email: params[:email])
      user.authenticate(password)
    end

end
