class User < ApplicationRecord
  #creates salted hash based onthe password
  #provide an authenticate method to check if password in login form is a match
   has_secure_password

   validates :email, presence: true
   validates :password, presence: true
end
