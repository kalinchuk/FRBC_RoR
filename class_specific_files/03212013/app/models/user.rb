class User < ActiveRecord::Base
  attr_accessible :age, :email, :name
  belongs_to :group
  
  scope :smiths, where("name LIKE ?", "%Smith%")
end