class User < ApplicationRecord
 validates :first_name, :last_name, :token, :oauth_expires_at, presence: true
 validates :email, presence: true, uniqueness: true

end
