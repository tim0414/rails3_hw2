class Subscribe < ActiveRecord::Base
  attr_accessible :owner_id, :subscriber_id, :nickname

  belongs_to :owner, class_name: "User"
  belongs_to :subscriber, class_name: "User"

  has_many :shares, dependent: :delete_all
  has_many :cameras, through: :shares, dependent: :delete_all
  #has_one :owner, class_name: "User"
  #has_one :subscriber, class_name: "User"
end
