class SessionsController < ApplicationController
  @@lock = Mutex.new

  def create
    @@lock.synchronize do
      user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
    end
    redirect_to root_url, notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end
end
