class PagesController < ApplicationController
  def index
  end

  def home
    # grab the username from the URL as :id
    if (User.find_by_username(params[:id]))
      @username = params[:id]
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
