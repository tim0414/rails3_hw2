class SubscribesController < ApplicationController
    def create
        
        if User.find_by_email(params[:email]) == nil
            respond_to do |format|
                format.html { redirect_to :back, notice: 'The email doesn\'t exist!' }
                format.json { head :no_content }
            end
        elsif @@owner.email == params[:email]
            respond_to do |format|
                format.html { redirect_to :back, notice: 'You can\'t add yourself as your subscriber!' }
                format.json { head :no_content }
            end
        elsif @@owner.owner_subscribes.find_by_subscriber_id(User.find_by_email(params[:email]).id)
            respond_to do |format|
                format.html { redirect_to :back, notice: 'The user is already your subscribers' }
                format.json { head :no_content }
            end
        else
            subscriber = User.find_by_email(params[:email])
            @new_subscriber = Subscribe.new(nickname:params[:nickname], subscriber_id: subscriber.id, owner_id: @@owner.id)
            @new_subscriber.save
            redirect_to :back
        
        end
        

=begin
        if subscriber = User.find_by_email(params[:email])
            #puts "id: #{subscriber.class}"
            @new_subscriber = Subscribe.new(nickname:params[:nickname], subscriber_id: subscriber.id, owner_id: @@owner.id)
            @new_subscriber.save
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
        @subscriber = Subscribe.find(params[:id])
        @subscriber.destroy

        respond_to do |format|
            format.html { redirect_to :back, notice: 'Subscriber was successfully destroyed.' }
            format.json { head :no_content }
        end
    
    end

    def self.set_owner(owner)
        @@owner = owner
    end



end
