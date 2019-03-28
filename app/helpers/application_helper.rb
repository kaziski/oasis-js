module ApplicationHelper

  def logged_in_as
    if current_user.username.present?
      "Logged in as #{current_user.username}" 
    else   
      "Logged in as #{current_user.email}"
    end
  end

end