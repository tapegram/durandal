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
        redirect_to @tournament, alert: "Tournament created successfully."
    else
        redirect_to new_tournament_path, alert: "Error creating tournament."
    end
  end
  
  def edit
    @tournament = Tournament.find(params[:id])
  end
  
  def reg
    @tournament = Tournament.find(params[:id])
  end
  
  def update
    @tournament = Tournament.find(params[:id])
    if @tournament.update_attributes(user_params)
        redirect_to @tournament, alert: "tournament updated successfully."
    else 
        redirect_to new_tournament_path, alert: "Error updating tournament."
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
