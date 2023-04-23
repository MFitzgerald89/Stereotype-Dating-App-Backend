class GenresController < ApplicationController

  def index

    genre = Genre.all

    render json: genre.as_json

  end

  def create
    genre = Genre.create!(
      name: params[:name],
      band_id: params[:band_id],
      user_id: params[:user_id]
    )
    if genre.save
      render json: {message: "Genre added successfully!"}, status: :created
    else
      render json: {errors: genre.errors.full_messages}, status: :bad_request
    end
  end

  def show
    
    genre = Genre.find_by(id: params[:id])

    render json: genre.as_json
  end

  def update
    genre = Genre.find_by(id: params["id"])

    genre.update!(
      
      name: params["name"] || genre.name
    )

    render json: genre.as_json
  end

  def destroy

    genre = Genre.find_by(id: params[:id])

    genre.destroy

    render json:{message: "Genre Removed"}

  end

end
