class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @students = User.where(canbeinstructor: false)
    @instructors = User.where(canbeinstructor: true)
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  def show
  end



private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :photo, :role, :active, :email, :canbeinstructor)
  end
end

