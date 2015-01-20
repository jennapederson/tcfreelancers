class HomeController < ApplicationController

  def index
    @users = User.order(available_for_hire: :desc).page params[:page]
  end

end
