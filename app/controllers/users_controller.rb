class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in
  # has_secure_password
  # validates email
  #validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Invalid email" }

  def new
    render "users/new"
  end

  def create
    new_user = User.new(
      name: params[:name],
      role: params[:role],
      email: params[:email],
      password: params[:password],
    )
    new_user.save
    if new_user.save
      session[:current_user_id] = new_user.id
      session[:current_user_role] = new_user.role
      #redirect_to menus_path
      flash[:success] = "you've signed-up successfully ! please sign-in to continue"
      redirect_to "/"
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
end
