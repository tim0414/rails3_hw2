class Subscribe < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  belongs_to :subscriber, class_name: "User"

  #has_one :owner, class_name: "User"
  #has_one :subscriber, class_name: "User"
end
