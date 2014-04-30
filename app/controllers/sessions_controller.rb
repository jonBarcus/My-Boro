class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    end
  end

  def destroy
    @current_user = session[:user_id] = nil
    flash[:notice] = "Goodbye! See you again soon."
    redirect_to root_url
  end


end
