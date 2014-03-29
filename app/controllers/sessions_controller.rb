class SessionsController < ApplicationController

  def new
  end

  def create
    #render 'new'
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      # sign in user and redirect to their page
      sign_in user
      redirect_to user
    else
      # create error message and redirect signin page
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end

  end

  def destroy
  end

end
