class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!
  def after_sign_in_path_for(resource)

    if !current_user.profile.nil?
        profile_path(current_user.profile)
    else
        new_profile_path
    end

  end
end
