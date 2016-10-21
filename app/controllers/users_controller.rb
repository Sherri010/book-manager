class UsersController < ApplicationController
  def new
     @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
       #flash is avaibable globaly and its name is reserved
       #data is persisnt in flash until the next request
       flash[:success] = "Success create"
       redirect_to "/login"
    else
       flash[:error] = "something went wrong"
       redirect_to signup_path
    end
  end
  def show
    render 'login.html'
  end



  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
