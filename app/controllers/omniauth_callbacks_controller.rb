class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def linkedin
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in @user

    redirect_to edit_user_registration_path
  end
end