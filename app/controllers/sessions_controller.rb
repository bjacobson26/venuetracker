class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #find user by email 
    u = User.where(email:params[:user][:email]).first
    # if u is not nothing and password is authenticated
    if u != nil && u.authenticate(params[:user][:password])
      session["user_id"] = u.id.to_s
      session["user_email"] = u.email.to_s
      session["user_name"] = u.name.to_s
      redirect_to user_venues_path   

    else 
      redirect_to new_sessions_path
    end


  end

  def destroy
    session.destroy
    redirect_to new_sessions_path
  end
end
