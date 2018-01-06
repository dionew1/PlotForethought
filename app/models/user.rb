class User < ApplicationRecord
validates :email, presence: true, uniqueness: true
 validates :first_name,
           :last_name,
           :token,
           :refresh_token,
           :oauth_expires_at,
           :google_id,
           presence: true


 def self.create_or_update(auth)
   user = User.find_by(google_id: auth[:uid]) || User.new
   user.attributes = {
    google_id: auth[:uid],
    email: auth[:info][:email],
    first_name: auth[:info][:first_name],
    last_name: auth[:info][:last_name],
    token: auth[:credentials][:token],
    refresh_token: auth[:credentials][:refresh_token],
    oauth_expires_at: auth[:credentials][:expires_at]
  }
  user.save!
  user
 end
end
