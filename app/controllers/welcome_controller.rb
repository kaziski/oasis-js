class WelcomeController < ApplicationController

  def log_in_welcome
    @plants = Plant.all
  end
end
