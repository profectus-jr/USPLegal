class MessengerController < ApplicationController
  def box
  	@messages = nil
  	@mode = param[:box]
  	
  	if (@mode nil?)
  		@mode = "inbox"
  	end
  	
  	if (@mode == "inbox")
  		@messages = MSMessage.where(:id = 0)
  	end
  	else if (@mode == "sent")
  		@messages = MSMessage.where(:id = 0)
  	end
  	else if (@mode == "important")
  		@messages = MSMessage.where(:id = 0)
  	end
  	else if (@mode == "bin")
  		@messages = MSMessage.where(:id = 0)
  	end
  	
  end
  
  def compose
  end
end
