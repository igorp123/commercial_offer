class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id

      flash[:success] = "Welcome to the app, #{current_user.name_or_email}"

      redirect_to root_path
    else
      render :new
    end


  end

  def new
    @user = User.new
  end
end

private

def user_params
  params.required(:user).permit(:name, :email, :password, :password_confirmation)
end
