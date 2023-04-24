class MatchesController < ApplicationController

  def index

    match = Match.all

    render json: match.as_json

  end

  def show

    match = Match.find_by(params[:id])

    render json: match.as_json

  end

  def create

    user_id = params[:user_id]
    match_id = params[:match_id]
    pp User.exists?(user_id)
    pp User.exists?(match_id)
      # Check if the user and potential match both exist
    if User.exists?(user_id) && User.exists?(match_id)
    # Create the match
      match = Match.create(user_id: user_id, match_id: match_id)
    
      render json: { message: "Match created successfully", match: match }
    else
      render json: { error: "User or potential match does not exist" }
    end

  end

  def update

    match = Match.find_by(id: params[:id])

    if match

      match.update_attributes(match_params)

      render json: {message: "Match updated"}

    else 

      render json: {message: "Match not found"}
    
    end

  end

  def destroy

    match = Match.find_by(id: params["id"])

    match.destroy

    render json: {message: "Match Removed"}

  end
end
