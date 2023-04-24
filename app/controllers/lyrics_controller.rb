class LyricsController < ApplicationController

  def index

    lyric = Lyric.all

    render json: lyric.as_json

  end

  def show

    lyric = Lyric.find_by(id: params[:id])

    render json: lyric.as_json

  end

  def create

    lyric = Lyric.create!(

      lyrics: params[:lyrics],
      notes: params[:notes],
      song_id: params[:song_id],
      user_id: params[:user_id]
    )

    if lyric.save 
      render json: {messages: "Lyric Saved"}

    else
      render json: {errors: lyric.errors.full_messages},status: :bad_request
    end  

  end

  def update

    lyric = Lyric.find_by(id: params["id"])

    lyric.update(
      
      lyrics: params["lyrics"] || lyric.lyrics,
      notes: params["notes"] || lyric.notes
    )

    render json: lyric.as_json

  end

  def destroy

    lyric = Lyric.find_by(id: params[:id])

    lyric.destroy

    render json: {messages: "Lyrics Removed"}

  end

end
