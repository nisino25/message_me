class MmessagesController < ApplicationController
 before_action :require_user

    def create
        mmessage = current_user.mmessages.build(mmessage_params)
        if mmessage.save
            ActionCable.server.broadcast "chatroom_channel",
                                        mod_mmessage: mmessage_render(mmessage)
        end
    end

    private
    
    def mmessage_params
        params.require(:mmessage).permit(:body)
    end

    def mmessage_render(mmessage)
        render(partial: 'mmessage', locals: {mmessage: mmessage})
    end

end