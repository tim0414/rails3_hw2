class SubscribesController < ApplicationController
    def create
        
        if subscriber = User.find_by_email(params[:email])
            #puts "id: #{subscriber.class}"
            @new_subscriber = Subscribe.new(nickname:params[:nickname], subscriber_id: subscriber.id, owner_id: 1)
            @new_subscriber.save
        end
        #@new_subscriber = Subscribe.new(nickname:params[:nickname], subscriber_id: 4, owner_id: 1)
        #@new_subscriber.save
        redirect_to :back
        #@new_subscriber = Subscribe.new(nickname:params[:nickname], subscriber_id: subscriber.id)
        #format.html { redirect_to :back, notice: 'Camera can not be empty.' }
        #format.json { head :no_content }

    end

    def destroy
        @subscriber = Subscribe.find(params[:id])
        @subscriber.destroy

        respond_to do |format|
            format.html { redirect_to :back, notice: 'Subscriber was successfully destroyed.' }
            format.json { head :no_content }
        end
    
    end


end
