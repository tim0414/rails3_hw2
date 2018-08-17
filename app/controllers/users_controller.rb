class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @cameras = @user.cameras.paginate(:page => params[:page])

    @owner = @user.owner_subscribes.paginate(:page => params[:page])
    @subscriber = @user.subscriber_subscribes.paginate(:page => params[:page])

    @new_camera = @user.cameras.build
    @new_subscriber = @user.subscriber_subscribes.build

  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  
  end

end
