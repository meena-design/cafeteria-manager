class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in

  #def new
  #render "index"
  #end

  def index
    if current_user
      redirect_to orders_path
    else
      render "index"
    end
  end
end
