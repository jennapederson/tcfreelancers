class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def linkedin
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.last_sign_in_at.nil?
        sign_in @user
        redirect_to edit_user_registration_path({:new => true})
    else
        sign_in @user
        redirect_to root_path
    end
  end
end