module UsersHelper
    def show_share_info(user)
        shared_camera = []
        user.subscriber_subscribes.each do |sub|
            sub.shares.each do |share_info|
                shared_camera.append(Camera.find(share_info.camera_id).name)
            end
        end
        shared_camera
    end

end
