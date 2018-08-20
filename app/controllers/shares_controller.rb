class SharesController < ApplicationController
    def create
        @camera = Camera.find(@@camera_id)
        @user = User.find(@camera.user_id)
        
        if User.find_by_email(params[:email]) == nil
            respond_to do |format|
                format.html { redirect_to :back, notice: 'The email doesn\'t exist!' }
                format.json { head :no_content }
            end
            return
        end

        subscriber = User.find_by_email(params[:email])
        
        if (subscribe = @user.owner_subscribes.find_by_subscriber_id(subscriber.id))==nil
            respond_to do |format|
                format.html { redirect_to :back, notice: 'The user is not your subscriber!' }
                format.json { head :no_content }
            end
        elsif @camera.shares.find_by_subscribe_id(subscribe.id)
            respond_to do |format|
                format.html { redirect_to :back, notice: 'The camera is already share to the subscriber!' }
                format.json { head :no_content }
            end
        else
            subscribe_id = @user.owner_subscribes.find_by_subscriber_id(subscriber.id).id
            @new_share = Share.new( subscribe_id:subscribe_id,
                        camera_id: @@camera_id)
            @new_share.save
            redirect_to :back
        end
=begin
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
=end
        #@new_subscriber = Subscribe.new(nickname:params[:nickname], subscriber_id: 4, owner_id: 1)
        #@new_subscriber.save
        #redirect_to :back
        #@new_subscriber = Subscribe.new(nickname:params[:nickname], subscriber_id: subscriber.id)
        #format.html { redirect_to :back, notice: 'Camera can not be empty.' }
        #format.json { head :no_content }

    end

    def destroy
        share = Share.find(params[:id])
        share.destroy
        respond_to do |format|
            format.html { redirect_to :back, notice: 'Shared camera was successfully removed.' }
            format.json { head :no_content }
        end        
    end

    def self.set_camera_id(id)
        @@camera_id = id
        " "
    end

    def self.set_subscriber(subscriber)
        @@subscriber = subscriber
    end



end