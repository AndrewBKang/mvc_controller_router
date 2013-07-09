class Contact < ActiveRecord::Base
  attr_accessible :address, :email, :name, :phone_number, :favorite

  belongs_to :user

  validates :name, :presence => true
end
