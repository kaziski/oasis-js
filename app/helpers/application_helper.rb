module ApplicationHelper

  def logged_in_as
    if current_user.username.present?
      "Logged in as #{current_user.username.capitalize}" 
    else   
      "Logged in as #{current_user.email.split('@')[0].capitalize}"
    end
  end

end