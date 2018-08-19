module UsersHelper
=begin
    def show_share_info(user)
        shared_camera = []
        user.subscriber_subscribes.each do |sub|
            sub.shares.each do |share_info|
                shared_camera.append(Camera.find(share_info.camera_id))
            end
        end
        shared_camera
    end
=end
    def shared_camera_count(user)
        count = 0
        subscribe_list = Subscribe.all
        subscribe_list.each do |subscribe|
            if user.id == subscribe.subscriber_id
                if Share.find_by_subscribe_id(subscribe.id)
                    count += 1
                end
            end
        end
        count
    end

end
