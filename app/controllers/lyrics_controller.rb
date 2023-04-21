class LyricsController < ApplicationController

  def index

    lyric = Lyric.all

    render json: lyric.as_json

  end

  def show

    lyric = Lyric.find_by(params[:id])

    render json: lyric.as_json

  end

  def create

    lyric = Lyric.create!(

      lyrics: params[:lyrics],
      notes: params[:notes],
      song_id: params[:song_id],
      user_id: parans[:user_id]
    )

    if lyric.save 
      render json: { messages: "Lyric Saved" }

    else
      render json { messages: error.full_messages}.status: :bad_request
    end  

  end

  def update

    lyric = Lyric.find_by(id: params["id"])

    lyric.update(
      lyrics: params["lyrics"] || lyrics.lyrics,
      notes: params["notes"] || lyrics.notes
    )

  end

  def destroy

    lyric = Lyric.find_by(id: params[:id])

    lyric.destroy

    render json: {messages: "Lyrics Removed"}

  end

end
