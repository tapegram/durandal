class TournamentsController < ApplicationController
  def index
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(user_params)
    if @tournament.save
        current_user.tournaments << @tournament # Add the new tournament to the user.
        redirect_to @tournament, alert: "User created successfully."
    else
        redirect_to new_tournament_path, alert: "Error creating user."
    end
  end

  def show
    @tournament = Tournament.find(params[:id])
  end
  
  private

  def user_params
    params.require(:tournament).permit(:name, :age, :weapon, :team, :date, :sex)
  end
end
