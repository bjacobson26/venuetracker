class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

 

  def create
  	user = User.new(params.require(:user).permit(:name, :email, :username, :password, :password_confirmation, :city))
      if user.save
        u = User.where(email:params[:user][:email]).first
        session["user_id"] = u.id.to_s
        session["user_email"] = u.email.to_s
        session["user_name"] = u.name.to_s
            redirect_to user_venues_path
      else
        redirect_to new_user_path
      end
  end

  def edit
    @user = current_user
  end


  def update
    if current_user != nil && current_user.authenticate(params[:user][:old_password])
      if current_user.update_attributes(params.require(:user).permit(:password, :password_confirmation))
        redirect_to user_venues_path
      else
        redirect_to user_edit_path(current_user)
      end
    end
  end

  def show
    @user = current_user
  end


  def destroy 
    raise current_user.user_venues.inspect#.where(params[])
  end

  def user_params
   params.require(:user).permit(:email, :avatar)
  end

end