class MessagesController < ApplicationController
    def index
        @message = Message.all
        @message = Message.new
    end

    def create
        @message = Message.new(message_params)
        if @message.save
            redirect_to message_path
        else
            @messages = Message.all 
            render :index
        end
    end

    private

    def message_params
        params.require(:message).permit(:content)
    end

    def require_login
        unless logged_in?
          flash[:error] = 'You must be logged in to access this page.'
          redirect_to login_path
        end
    end
end
