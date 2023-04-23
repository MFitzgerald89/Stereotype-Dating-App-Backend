class BandsController < ApplicationController

  def index

    band = Band.all

    render json: band.as_json

  end

  def create
    band = Band.create!(
      name: params[:name],
      notes: params[:notes],
      genre_id: params[:genre_id],
      user_id: params[:user_id]
    )
    if band.save
      render json: {message: "Band Added Successfully"}, status: :created
    else
      render json: {errors: band.errors.full_messages}, status: :bad_request
    end
  end

  def show

    band = Band.find_by(id: params[:id])

    render json: band.as_json
  end

  def update
    band = Band.find_by(id: params["id"])

    band.update(
      
      name: params["name"] || band.name,
      notes: params["notes"] || band.notes,
      genre_id: params["genre_id"] || band.genre_id,
      user_id: params["user_id"] || band.user_id

    )

    render json: band.as_json

  end

  def destroy

    band = Band.find_by(id: params[:id])

    band.destroy

    render json:{message: "Band Removed"}

  end

end
