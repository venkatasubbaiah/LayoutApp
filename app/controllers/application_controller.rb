class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(current_user)
    if user_signed_in?
       new_profile_path
    end
  end

end
