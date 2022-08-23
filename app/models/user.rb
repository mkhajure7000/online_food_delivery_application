class User < ApplicationRecord
  has_secure_password

  #VALIDATIONS
  validates :name, :email, :password, :contact_number, presence: true
  validates :password, confirmation: { case_sensitive: true }
  validates :email, uniqueness: true

end
