class PhotosController < ApplicationController


def create

  photo = Photo.create!(
    user_id: current_user.id,
    image: params[:image]
  )

  if photo.save
    render json: { message: "Photo Added Successfully" }, status: :created
  else
    render json: { message: photo.errors.full_messages }, status: :bad_request
  end

end


def index

  photo = Photo.all

  render json: photo.as_json

end

def update

photo = Photo.find_by(id: params[:id])

photo.update(
  image: params["image"] || photo.image
)

render json: photo.as_json

end

def destroy

  photo = Photo.find_by(id: params[:id])

  photo.destroy

  render json:{message: "Photo Removed"}

end

end
