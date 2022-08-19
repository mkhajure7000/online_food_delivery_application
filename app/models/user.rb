class User < ApplicationRecord
  has_secure_password
  validates :name,:email,:password, presence: true
  validates :password, confirmation: { case_sensitive: true }
end
