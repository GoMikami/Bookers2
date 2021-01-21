class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def index
    @book = Book.new
    @users = User.all
  end


  def show
    @user = User.find(params[:id])
    @book = Book.new
    @users = @user.books

  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully.'
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = current_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(@user)
    end
  end

end
