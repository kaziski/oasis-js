class CallbacksController < ApplicationController
  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])
    # binding.pry
    #username is returning nil when logging in with google. How can I grub the username?
    sign_in_and_redirect @user
  end
  

  def failure
    flash[:error] = 'There was a problem signing you in. Please register or try signing in later.' 
    redirect_to new_user_registration_url
  end
end
