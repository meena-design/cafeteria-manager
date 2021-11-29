class ActiveMenusController < ApplicationController
  def index
  end

  def update
    new_active_menu = params[:menu_id]

    if Menu.exists?(new_active_menu)
      ActiveMenu.first.update(active_menu: new_active_menu)
      redirect_to menus_path
    else
      flash[:error] = "Menu Item does not exists . Please enter a valid one !"
      redirect_to menus_path
    end
  end
end
