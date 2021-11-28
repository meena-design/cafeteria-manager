class OrdersOwnerCompleted
  Controller < ApplicationController
  before_action :ensure_owner

  def index
  end
end
