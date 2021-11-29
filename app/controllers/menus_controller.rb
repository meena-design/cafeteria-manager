class MenusController < ActionController::Base
  #skip_before_action :verify_authenticity_token
  #before_action :ensure_owner

  def index
  end

  def create
    newmenu = Menu.new(name: params[:menu_name])
    if newmenu.save
      redirect_to menus_path
    else
      flash[:error] = newmenu.errors.full_messages.join(", ")
      redirect_to menus_path
    end
  end

  def new
  end
end
