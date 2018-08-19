class Camera < ActiveRecord::Base
  belongs_to :user
  has_many :shares, dependent: :destroy
  has_many :subscribes, through: :shares

  validates :name, :presence => true,
            :length => {:maximum => 50}
end
