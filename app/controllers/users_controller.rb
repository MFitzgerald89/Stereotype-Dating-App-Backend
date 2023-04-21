class UsersController < ApplicationController

  def index

    user = User.all

    render json: user.as_json

  end

  def create
    user = User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    user_id = params[:id]

    user = User.find_by[id: user_id]

    render json: user.as_json
  end

  def update
    user = User.find_by(id: params["id"])

    user.update(
      first_name: params["first_name"] || user.first_name,
      last_name: params["last_name"] || user.last_name,
      email: params["email"] || user.email,
      age: params["age"] || user.age,
      orientation: params["orientation"] || user.orientation,
      preferred_orientation: params["preferred_orientation"] || user.preferred_orientation,
      religion: params["religion"] || user.religion,
      location: params["location"] || user.location

    )
  end

  def destroy

    user = User.find_by(id: params[:id])

    user.destroy

    render json:{message: "Account Deleted"}

  end

end
