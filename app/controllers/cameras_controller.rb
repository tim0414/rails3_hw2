class CamerasController < ApplicationController
    def create

        if @@user.cameras.build(params[:camera]).invalid?
            #redirect_to :back
            #return
            respond_to do |format|
                format.html { redirect_to :back, notice: 'Camera can not be empty.' }
                format.json { head :no_content }
            end
            return
        end

        @camera = @@user.cameras.build(params[:camera])
       
        if @camera.save
            flash[:success] = "Camera created!"
            #redirect_to 'employee#index'
            CamerasController.set_user(@@user)
            redirect_to :back
        else
            render 'users#index'
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
