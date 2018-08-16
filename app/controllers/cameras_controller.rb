class CamerasController < ApplicationController
    def create
    end

    def show
        @camera = Camera.find(params[:id])
        @user = User.find(@camera.user_id)
        @shares = @camera.shares.paginate(:page => params[:page])
    end
end
