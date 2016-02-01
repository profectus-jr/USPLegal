class WelcomeController < ApplicationController
  layout "notauth", only: [:welcome]


  def welcome
  	if user_signed_in? 
  	redirect_to "/home"
  	end
  
  end
  
end
