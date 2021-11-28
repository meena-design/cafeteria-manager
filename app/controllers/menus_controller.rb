class MenusController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def index
    #@menuitems = menu.menu_items
    #render "index"
    # here choose menu items of a concerned menu
  end

  def new
    newmenu = Menu.new(name: params[:menu_name])
    if newmenu.save
      redirect_to menus_path
      #flash[:success] = "You have added new menu category successfully.! "
      #render "You have added new menu category successfully.!"
    else
      flash[:error] = newmenu.errors.full_messages.join(", ")
      redirect_to "/menus/new"
    end
  end

  def create
  end

  def show
    id = params[:id]
  end
end
