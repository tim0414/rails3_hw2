class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @cameras = @user.cameras.paginate(:page => params[:page])
    @camera = @user.cameras.build

    @owner = @user.owner_subscribes.paginate(:page => params[:page])

    @subscriber = @user.subscriber_subscribes.paginate(:page => params[:page])

  end
  
  def new
  end
end
