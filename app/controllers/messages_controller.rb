class MessagesController < ApplicationController
    def index
        @message = Message.all
        @message = Message.new
    end

    def create
        @message = current_user.messages.build(message_params)
        if @message.save
          redirect_to conversation_path(@message.conversation)
        else
          # Handle validation errors
        end
    end

    private

    def message_params
        params.require(:message).permit(:content, :conversation_id)
    end

    def require_login
        unless logged_in?
          flash[:error] = 'You must be logged in to access this page.'
          redirect_to login_path
        end
    end
end
