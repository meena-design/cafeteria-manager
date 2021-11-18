class UsersController < ApplicationController
  #skip_before_action :ensure_user_logged_in
  has_secure_password

  def new
    render "users/new"
  end

  def create
    newuser = User.new(
      name: params[:name],
      role: params[:role],
    )
    newuser.save!
    render "Record created successfully"
  end
end
