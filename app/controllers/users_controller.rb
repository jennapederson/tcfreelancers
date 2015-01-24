class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end
    
  def autocomplete_specialties
    @specialties = ActsAsTaggableOn::Tag
      .where("name LIKE ?", "#{params[:q]}%")
      .order(:name)
    respond_to do |format|
      format.json { render :json => @specialties.collect{|specialty| {:id => specialty.name, :name => specialty.name }} }
    end
  end
end
