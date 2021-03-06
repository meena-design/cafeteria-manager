class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def create
    email = params[:email]
    password = params[:password]

    user = User.find_by(email: email)

    if (user && user.authenticate(password))
      session[:current_user_id] = user.id
      session[:current_user_role] = user.role

      flash[:success] = "Signed in Successfully !"
      redirect_to "/"
    else
      flash[:error] = "Invalid Login ! Please Try Again !"
      redirect_to new_sessions_path
    end
  end

  def destroy
    session[:current_user_role] = nil
    session[:current_user_id] = nil
    session[:current_order_id] = nil
    @current_user = nil
    redirect_to "/"
  end
end
