class User < ActiveRecord::Base
    attr_accessible :name, :email#, :password, :password_confirmation

    has_many :subscriber_subscribes, class_name: 'Subscribe', 
             foreign_key: 'subscriber_id', dependent: :delete_all
    has_many :owner_subscribes, class_name: 'Subscribe', 
             foreign_key: 'owner_id', dependent: :delete_all

    has_many :cameras, dependent: :delete_all


    email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    validates :name, :presence => true,
                     :length => {:maximum => 50}
    validates :email, :presence => true,
                      :format => {:with=>email_regex},
                      :uniqueness => {:case_sensitive => false}
    #validates :password, presence: true,
    #                     confirmation: true,
    #                     length: {within: 6..40}

end
