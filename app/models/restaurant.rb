class Restaurant < ApplicationRecord

  # ASSOCIATIONS
  belongs_to :user
  
  #VALIDATIONS
  validates :name, :address, presence: true

end
