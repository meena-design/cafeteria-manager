class ActiveMenusController < ApplicationController

  # ? => /active_menus
  # ? GET
  def index
    render plain: "Hello from Active Menus Route"
  end

  # ? => /active_menus
  # ? PUT
  def update
    new_active_menu = params[:menu_id]
    # ? Validating Setting Menu_id
    if Menu.exists?(new_active_menu)
      ActiveMenu.first.update(active_menu: new_active_menu)
      redirect_to menus_path
    else
      flash[:error] = "Menu Item does not exists . Please enter a valid one !"
      redirect_to menus_path
    end
  end
end
