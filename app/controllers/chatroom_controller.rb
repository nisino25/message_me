class ChatroomController < ApplicationController
  before_action :require_user

  def index
    @mmessage = Mmessage.new
    @mmessages = Mmessage.custom_display
  end

  

end
