class User < ActiveRecord::Base
  attr_accessible :email, :name, :token

  validates :name, :presence => true
  validates :email, :presence => true

  has_many :contacts
end
