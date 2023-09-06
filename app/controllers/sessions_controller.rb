class SessionsController < ApplicationController
    def new
        @user = User.new
      end
    
      def create
        @user = User.find_by(email: params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
          log_in @user
          redirect_to root_path, notice: 'Login successful!'
        else
          flash.now[:error] = 'Invalid email/password combination'
          render 'new'
        end
      end
    
end
