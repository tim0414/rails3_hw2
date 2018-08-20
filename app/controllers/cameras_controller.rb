class CamerasController < ApplicationController
    def index
        @cameras = Camera.all
    end
    
    def create

        if @@user.cameras.build(params[:camera]).invalid?
            #redirect_to :back
            #return
            respond_to do |format|
                format.html { redirect_to :back, notice: 'Camera can not be empty.' }
                format.json { head :no_content }
            end
        
        elsif @@user.cameras.find_by_name(params[:camera][:name])
            respond_to do |format|
                format.html { redirect_to :back, notice: 'The camera name has existed.' }
                format.json { head :no_content }
            end

        else
            @camera = @@user.cameras.build(params[:camera])
            @camera.save
            flash[:success] = "Camera created!"
            #redirect_to 'employee#index'
            CamerasController.set_user(@@user)
            respond_to do |format|
                format.html { redirect_to :back, notice: 'Camera created!' }
                format.json { head :no_content }
            end
        return
        end

    end

    def show
        @camera = Camera.find(params[:id])
        @user = User.find(@camera.user_id)
        @shares = @camera.shares.paginate(:page => params[:page])

        @owner = @user.owner_subscribes.paginate(:page => params[:page])
        @new_share = @camera.shares.build
    end

    def self.set_user(user)
        @@user = user
        ''
    end

    def destroy
        @camera = Camera.find(params[:id])
        @camera.destroy

        respond_to do |format|
            format.html { redirect_to :back, notice: 'Cameras was successfully destroyed.' }
            format.json { head :no_content }
        end
    end
end
