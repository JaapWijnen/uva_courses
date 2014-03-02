class SessionsController < ApplicationController
	def new
	end

def create
    user = User.find_by(email: params[:session][:email].downcase)
    # if user fills in correct email/password log user in and redirect
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    # when email/password combination is invalid show errors
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

	def destroy
		sign_out
		redirect_to root_url
	end
end
