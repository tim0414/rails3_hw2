class SharesController < ApplicationController
    def create
        @camera = Camera.find(@@camera_id)
        @user = User.find(@camera.user_id)
        if User.find_by_email(params[:email])
            subscriber_id = User.find_by_email(params[:email]).id
        
            if @user.owner_subscribes.find_by_subscriber_id(subscriber_id)
                subscribe_id = @user.owner_subscribes.find_by_subscriber_id(subscriber_id).id
                #puts "id: #{subscriber.class}"
                @new_share = Share.new(camera_id:params[:id], subscribe_id:subscribe_id,
                            camera_id: @@camera_id)
                @new_share.save
            end
        end
        #@new_subscriber = Subscribe.new(nickname:params[:nickname], subscriber_id: 4, owner_id: 1)
        #@new_subscriber.save
        redirect_to :back
        #@new_subscriber = Subscribe.new(nickname:params[:nickname], subscriber_id: subscriber.id)
        #format.html { redirect_to :back, notice: 'Camera can not be empty.' }
        #format.json { head :no_content }

    end

    def destroy
        @share = Share.find(params[:id])
        @share.destroy

        respond_to do |format|
            format.html { redirect_to :back, notice: 'Subscriber was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    def self.set_camera_id(id)
        @@camera_id = id
        " "
    end



end