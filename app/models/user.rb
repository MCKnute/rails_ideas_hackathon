class User < ActiveRecord::Base
  has_secure_password
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: email_regex }
  validates :name, :password, presence: true
  validates :alias, presence: true, uniqueness: { case_sensitive: false }
end
