class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:dashboard]
  
  def home
  end

  def dashboard
  	@senders = current_user.senders
  end

end
