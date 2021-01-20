class UsersController < ApplicationController
  
  def index
    @book = Book.new
    @users = @user.books
  end
  
  def show
    @user = User.find(params[:id])
    @book =Book.new
    @users = @user.books
    
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully.'
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
