class MenuItemsController < ApplicationController
  before_action :ensure_owner

  def create
    newMenuItem = MenuItem.new(menu_id: params[:menu_id], name: params[:name], description: params[:description], price: params[:price])
    newMenuItem.save
    if newMenuItem.save
      redirect_to menus_path
    else
      flash[:error] = newMenuItem.errors.full_messages.join(",")
      redirect_to menus_path
    end
  end

  def destroy
    menuItem = MenuItem.find(params[:id])
    menuItem.destroy
    redirect_to menus_path
  end
end
