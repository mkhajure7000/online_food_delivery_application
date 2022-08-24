class Restaurant < ApplicationRecord

  # ASSOCIATIONS
  has_many :foods
  belongs_to :user
  
  #VALIDATIONS
  validates :name, :address, presence: true

end
