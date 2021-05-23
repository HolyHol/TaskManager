class PasswordReset < ActiveRecord::Base
  belongs_to :user
  has_secure_token
end
