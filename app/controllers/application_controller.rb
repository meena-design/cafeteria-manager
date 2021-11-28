class ApplicationController < ActionController::Base
  before_action :ensure_user_logged_in

  def current_user
    @current_user
  end

  def ensure_user_logged_in
    unless current_user
      redirect_to "/"
    end
  end

  def ensure_owner
    unless @current_user.role == "owner"
      redirect_to "/"
    end
  end

  def current_user
    return @current_user if @current_user
    current_user_id = session[:current_user_id]

    if current_user_id
      @current_user = User.find(current_user_id)
    else
      nil
    end
  end
end
