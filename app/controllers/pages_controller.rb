class PagesController < ApplicationController
  def index
  end

  def home
    # grab the username from the URL as :id
    if !current_user.nil?
      @username = current_user.username
    else
      # redirects to 404 (root for now)
      redirect_to root_path, :notice => "User not found!"
    end
  end

  def profile
  end

  def tournament
  end
end
