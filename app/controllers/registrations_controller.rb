class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  # Overwrite update_resource to let users to update their user without giving a password
  def update_resource(resource, params)
    if current_user.provider == "linkedin"
      params.delete("current_password")
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update).push(:first_name, :last_name, :headline, :description, :profile_url, :profile_image, :twitter_handle, :available_for_hire)
  end

end