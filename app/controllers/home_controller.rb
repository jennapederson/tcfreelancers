class HomeController < ApplicationController

  def index
    @users = User.order(:id).page params[:page]
  end

end
