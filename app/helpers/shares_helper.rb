module SharesHelper
    def get_subscriber(share)
        User.find(Subscribe.find(share.subscribe_id).subscriber_id)
    end
    def get_subscriber_nickname(share)
        Subscribe.find(share.subscribe_id).nickname
    end
    def get_subscriber_email(share)
        User.find(Subscribe.find(share.subscribe_id).subscriber_id).email
    end
end
