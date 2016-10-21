class SessionsController < ApplicationController
  include SessionsHelper

  def new
    redirect_to @current_user if @current_user
  end

  def create
    # query for email
    # if email not found go back with error
    # if found, make sure pass matches
    # redirect to book list if it's correct match
    # user = User.confirm(params[:email], params[:password])

     user = User.find_by(email: params[:email])
    if user
       current_user = user.authenticate(params[:password])
       if current_user
         session[:current_user] = current_user
         redirect_to books_path
       else
         flash[:error]="Incorrect user/pass"
         redirect_to :back
       end
    else
         flash[:error] = "Email was not found"
         redirect_to :back #go back to where you sent the request
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end