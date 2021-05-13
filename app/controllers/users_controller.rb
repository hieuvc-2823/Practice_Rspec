class UsersController < ApplicationController
  # before_action :logged_in_user, only: %i(destroy edit update)
  # before_action :load_user, only: %i(show destroy edit update)
  # before_action :correct_user, only: %i(edit update)
  before_action :logged_in_user, :load_user, :correct_user, only: :update


  def index
    @users = User.all
  end

  # def show; end

  # def edit; end

  def update
    if @user.update user_params
      flash[:success] = "Update profile success"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = "User not found"
    redirect_to root_path
  end

  def correct_user
    redirect_to(root_path) unless current_user? @user
  end
end
