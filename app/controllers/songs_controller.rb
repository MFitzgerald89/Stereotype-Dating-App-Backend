class SongsController < ApplicationController

  def index

    song = Song.all

    render json: song.as_json

  end

  def show

    song = Song.find_by(id: params[:id])

    render json: song.as_json

  end

  def create

    song = Song.create!(
      name: params[:name],
      band_id: params[:band_id],
      user_id: params[:user_id]
    )

    if song.save 

      render json: {message: "Song Added"}

    else

      render json: {errors: errors.full_messages}, status: :bad_request

    end

  end

  def update

    song = Song.find_by(id: params[:id])

    song.update(
      name: params[:name] || song.name
    )

    render json: song.as_json

  end

  def destroy

    song = Song.find_by(id: params[:id])

    song.destroy

    render json: {message: "Song Removed"}

  end

end
