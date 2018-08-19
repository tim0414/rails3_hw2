class Camera < ActiveRecord::Base
  belongs_to :user
  has_many :shares, dependent: :delete_all
  has_many :subscribes, through: :shares

  validates :name, :presence => true,
            :length => {:maximum => 50}
end
