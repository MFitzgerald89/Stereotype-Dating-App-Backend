class UsersController < ApplicationController

  def index

    @users = User.all

    render :index

  end

  def create
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
      photos: params[:photos]
    )
    if user.save
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
      photos: params["photos"] || user.photos
      )

    render json: user.as_json
  end

  def destroy

    user = User.find_by(id: params[:id])

    user.destroy

    render json:{message: "Account Deleted"}

  end

end
