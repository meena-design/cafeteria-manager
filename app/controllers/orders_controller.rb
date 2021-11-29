class OrdersController < ApplicationController
  def index
    if session[:current_order_id] == nil
      new_order = Order.create(user_id: session[:current_user_id], delivered_at: "", order_status: "cart")
      session[:current_order_id] = new_order.id
    end
  end

  def update
    id = params[:id]
    order_status = params[:order_status]
    if order_status == "queue"
      is_order_still_valid = Order.check_if_in_active_menu(id)
      if is_order_still_valid
        Order.find(id).update!(order_status: "queue")
        flash[:success] = "Your Order has been placed Successfully"
      else
        flash[:error] = "Your Order is Cancelled as items are not available any more"
      end
      session[:current_order_id] = nil
      redirect_to "/user/orders/"
    elsif order_status == "completed"
      Order.find(id).update!(order_status: "completed")
      redirect_to "/active/orders"
    end
  end
end
