module SubscribesHelper
    def get_shared_camera(owner, subscriber)
        shared_camera = []
        subscribe = owner.owner_subscribes.find_by_subscriber_id(subscriber.id)
        subscribe.shares.each do |share|
            shared_camera.append(Camera.find(share.camera_id).name)
        end
        shared_camera
    end 
end
