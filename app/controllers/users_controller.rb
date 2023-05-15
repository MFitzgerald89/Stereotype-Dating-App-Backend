class UsersController < ApplicationController

  def index

    @users = User.all

    render :index

  end

  def create

    photo_url = params[:photos]
    if params[:photos]
      response = Cloudinary::Uploader.upload(params["photos"], resource_type: :auto)
      photo_url = response["secure_url"]
    end
  

    user = User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      age: params[:age],
      orientation: params[:orientation],
      preferred_orientation: params[:preferred_orientation],
      religion: params[:religion],
      location: params[:location],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      photos: photo_url, 
      gender: params[:gender]
    )
    if user.save
      g_array = params[:genres].split(",")
      g_array.each do |genre|
        Genre.create!(
          name: genre,
          user_id: user.id
        )
         
      end
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { message: user.errors.full_messages }, status: :bad_request
    end
  end

  def show

    user = User.find_by(id: params[:id])

    render json: user.as_json(methods: [:user_matches, :genre_names])

  end

  def update
    user = User.find_by(id: params[:id])

    user.update(
      first_name: params["first_name"] || user.first_name,
      last_name: params["last_name"] || user.last_name,
      email: params["email"] || user.email,
      age: params["age"] || user.age,
      orientation: params["orientation"] || user.orientation,
      preferred_orientation: params["preferred_orientation"] || user.preferred_orientation,
      religion: params["religion"] || user.religion,
      location: params["location"] || user.location,
      photos: params["photos"] || user.photos, 
      gender: params["gender"] || user.gender
      )

    render json: user.as_json
  end

  def destroy

    user = User.find_by(id: params[:id])

    user.destroy

    render json:{message: "Account Deleted"}

  end

end
