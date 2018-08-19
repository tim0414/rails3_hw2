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

  def camera_info
    @user = User.find(params[:user])
    @cameras = @user.cameras.paginate(:page => params[:page]) 
    @new_camera = @user.cameras.build
  end

  def subscriber_info
    @user = User.find(params[:user])
    @owner = @user.owner_subscribes.paginate(:page => params[:page])
  end

  def subscribing_info
    @user = User.find(params[:user])
    @subscriber = @user.subscriber_subscribes.paginate(:page => params[:page])
  end

  def shared_camera_info
    @user = User.find(params[:user])
    @shared_camera = []
    @user.subscriber_subscribes.each do |sub|
        sub.shares.each do |share_info|
            @shared_camera.append(Camera.find(share_info.camera_id))
        end
    end
  end


end
