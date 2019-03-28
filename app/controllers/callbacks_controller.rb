class CallbacksController < ApplicationController
  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in_and_redirect @user
  end
  # def google_oauth2
  #   # This one throws an error because find_for_google_oauth2 is not defined.
  #   # You need to implement the method below in your model (e.g. app/models/user.rb)
  #   @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

  #   if @user.persisted?
  #     flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
  #     sign_in_and_redirect @user, :event => :authentication
  #   else
  #     session["devise.google_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end
  # end

  def failure
    flash[:error] = 'There was a problem signing you in. Please register or try signing in later.' 
    redirect_to new_user_registration_url
  end
end
