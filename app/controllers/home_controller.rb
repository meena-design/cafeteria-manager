class HomeController < ApplicationController
  # skip_before_action :ensure_user_logged_in

  def new
    render "index"
  end
end
