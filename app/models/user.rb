class User < ActiveRecord::Base
  has_many :bright_ideas
  has_many :likes
  has_secure_password
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: email_regex }
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :alias, presence: true, uniqueness: { case_sensitive: false }
end
