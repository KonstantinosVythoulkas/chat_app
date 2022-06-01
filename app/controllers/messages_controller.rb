class MessagesController < ApplicationController
  before_action :check_user

  def check_user
    $live_user = current_user.id
  end

    def create
        @message = current_user.messages.create(body: msg_params[:body],
                                                room_id: params[:room_id])
      end

      def msg_params
        params.require(:message).permit(:body)
      end
    
end
