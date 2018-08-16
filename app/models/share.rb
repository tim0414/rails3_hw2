class Share < ActiveRecord::Base
  belongs_to :camera
  belongs_to :subscribe
end
