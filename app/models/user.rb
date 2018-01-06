class User < ApplicationRecord
 validates :first_name, :last_name, :token, :oauth_expires_at, presence: true
 validates :email, presence: true, uniqueness: true


 def self.create_or_update
   user = User.find_by(uid: auth[:uid]) || User.new
   user.attributes = {
    uid: auth[:uid],
    email: auth[:info][:email],
    first_name: auth[:info][:first_name],
    last_name: auth[:info][:last_name],
    token: auth[:credentials][:token],
    oauth_expires_at: auth[:credentials][:expires_at]
  }
  user.save!
  user
 end
end
