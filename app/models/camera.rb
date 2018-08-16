class Camera < ActiveRecord::Base
  belongs_to :user
  has_many :shares
  has_many :subscribes, through: :shares
end
